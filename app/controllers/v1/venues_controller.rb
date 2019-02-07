class V1::VenuesController < ApplicationController

  def index
    venues = Venue.order(created_at: :desc)
    render json: venues
  end

  def show
    render json: venue
  end

  def create
    byebug
    venue = Venue.new venue_params
    
    if venue.save
      render json: {id: venue.id}
    else
      render(
        json: {errors: venue.errors},
        status: 422 # Unprocessable Entity
      )
    end
  end

  def destroy
    venue.destroy
    render(json: {status: 200}, status: 200)
  end

  private

  def venue
    @venue ||= Venue.find params[:id]
  end

  def venue_params
    params.require(:venue).permit(:name, :vicinity, :longitude, :latitude)
  end
end
