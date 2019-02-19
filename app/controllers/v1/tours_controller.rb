class V1::ToursController < ApplicationController
before_action :tour, only: [:create]
def index
  tours = Tour.order(created_at: :desc)
  render json: tours
end

def show
  # events = tour.events.order(created_at: :desc)
  # tour = Tour.where(id: params[:id]).joins(:events).joins(:venues)
  # tour = Tour.where(id: params[:id]).joins(events: [{venues: :venues}])
  tour = Tour.includes(events: :venue).find(params[:id])
  render json: tour
end

def create
  tour = Tour.new tour_params
  tour.save
  render json: {id: tour.id}, status: 200
end

private
  def tour
    @tour ||= Tour.find params[:id]
  end

  def tour_params
    params.require(:tour).permit(:title, :band)
  end
end
