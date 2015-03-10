class MetroController < ApplicationController

  def index
    @stations = MetroStation.closest_to lat: params[:lat], long: params[:long], radius: 1.0
    @next = MetroStation.next params[:lat], params[:long]
  end

end