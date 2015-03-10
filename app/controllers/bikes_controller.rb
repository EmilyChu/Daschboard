class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @stations = BikeStation.closest_to lat: params[:lat], long: params[:long], radius: 1.0
  end

  def favorites
    @stations = current_user.favorite_bike_stations
    render :index
  end

  def favorite
    current_user.track_bike_station params[:location]
    head :ok
  end

  def unfavorite
    current_user.untrack_bike_station params[:location]
    head :ok
  end
end
