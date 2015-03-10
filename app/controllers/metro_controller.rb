class MetroController < ApplicationController

  def index
    @stations = MetroStation.closest_to lat: params[:lat], long: params[:long], radius: 1.0
  end

end