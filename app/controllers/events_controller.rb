class EventsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  def index
    @event = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      flash[:notice] = 'Event added!'
      redirect_to root_path
    else
      flash[:error] = 'Failed to create event!'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description)
  end
end