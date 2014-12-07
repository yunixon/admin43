class EventsController < ApplicationController
  load_and_authorize_resource param_method: :event_params
  before_action :set_event, only: [:show, :edit, :update, :destroy,
                                   :to_moderate, :accept, :reject, :rewrite]
  before_action :authenticate_user!, except: [:show, :index]

  respond_to :html, :json

  def index
    @events = Event.accepted.order(:created_at).page(params[:page])
    respond_with(@events)
  end

  def show
    @attendees = EventAttendance.where(event_id: @event.id)
    respond_with(@event)
  end

  def new
    @event = Event.new
    respond_with(@event)
  end

  def edit
  end

  def create
    @event = current_user.organized_events.new(event_params)
    @event.save
    respond_with(@event)
  end

  def update
    @event.update(event_params)
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  def my_events
    @events = current_user.organized_events.order(:created_at).page(params[:page])
    respond_with(@events)
  end

  def join
    @event = Event.friendly.find(params[:event_id])
    if @event.accepted?
      @attendance = EventAttendance.join_event(current_user.id, params[:event_id])
      flash[:success] = 'Вы подтвердили участие' if @attendance.save
    else
      flash[:error] = 'Событие еще не одобрено'
    end
    redirect_to event_path(params[:event_id])
  end

  def moderating
    @events = Event.moderating.order(:created_at).page(params[:page])
    respond_with(@events) do |format|
      format.html { render :index }
    end
  end

  def to_moderate
    @event.submit! if @event.new?
    redirect_to event_path
  end

  def accept
    @event.accept! if @event.moderating?
    redirect_to event_path
  end

  def reject
    @event.reject! if @event.moderating?
    redirect_to event_path
  end

  def rewrite
    @event.rewrite! if @event.rejected?
    redirect_to event_path
  end

  private

  def set_event
    @event = Event.friendly.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :start_date, :end_date, :location, :agenda,
                                  :address, :logo, :organizer_id, :status)
  end
end
