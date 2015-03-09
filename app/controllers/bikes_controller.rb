class BikesController < ApplicationController
  def index
    @stations = BikeStation.closest_to lat: params[:lat], long: params[:long], radius: 1.0
  end
end
