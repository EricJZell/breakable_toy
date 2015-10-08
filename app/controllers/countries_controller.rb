class CountriesController < ApplicationController
  def index
    @countries = Region.find(params[:region_id]).countries
    @locations = @countries.first.locations
    render json: { countries: @countries, locations: @locations }
  end
end
