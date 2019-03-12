class V1::EventsController < ApplicationController

  def create
    tour = Tour.find params[:tour_id]
    event = Event.new event_params
    event.tour = tour
    event.user = current_user
    event.save
    render json: event
  end

  private
  def event_params
    params.require(:event).permit!
  end
end
