class V1::LocationsController < ApplicationController

  def index
    locations = Location.order(created_at: :desc)
    render json: locations 
  end
  
  def create
    location = Location.new location_params
    location.save
    render json: location
  end

  private
  def location
    @location ||= Location.find params[:id]
  end

  def location_params
    params.require(:location).permit(
                                    :city,
                                    :lat,
                                    :lng,
                                    :country,
                                    :iso2,
                                    :region,
                                    :capital,
                                    :population,
                                    :population_proper
                                    )
  end

end
