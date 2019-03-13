class V1::ToursController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
  
def index
  user = current_user
  tours = Tour.where("user_id = #{user.id}").order(created_at: :desc)
  render json: tours
end

def show
  tour = Tour.includes(events: :venue).find(params[:id])
  render json: tour
end

def create
  tour = Tour.new tour_params
  tour.user_id = current_user.id
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
