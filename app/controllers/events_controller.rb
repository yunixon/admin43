class EventsController < ApplicationController
  load_and_authorize_resource param_method: :event_params
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  respond_to :html, :json

  def index
    @events = Event.order(:created_at).page(params[:page])
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
    @attendance = EventAttendance.join_event(current_user.id, params[:event_id])
    'Request Sent' if @attendance.save
    respond_with @attendance do |format|
      format.html { redirect_to event_path(params[:event_id]) }
    end
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :start_date, :end_date, :location, :agenda, :address, :logo, :organizer_id)
    end
end
