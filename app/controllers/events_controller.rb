class EventsController < ApplicationController
  load_and_authorize_resource param_method: :event_params
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :event_owner!, only: [:edit, :update, :destroy]

  respond_to :html, :json

  def index
    @events = Event.order(:created_at).page(params[:page])
    respond_with(@events)
  end

  def show
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
    @events = current_user.organized_events
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_owner!
      if @event.organizer_id != current_user.id
        redirect_to events_path
        flash[:notice] = 'Недостаточно прав на обработку данного события'
      end
    end

    def event_params
      params.require(:event).permit(:title, :start_date, :end_date, :location, :agenda, :address, :logo, :organizer_id)
    end
end
