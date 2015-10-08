class LocationsController < ApplicationController
  def index
    @locations = Country.find(params[:country_id]).locations
    render json: { locations: @locations }
  end
end
