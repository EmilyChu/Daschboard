class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_bike_stations

  def favorite_bike_stations
    favorite_locations = user_bike_stations.pluck :location
    BikeShare.stations.select { |s| favorite_locations.include? s.location }
  end

  def track_bike_station location
    user_bike_stations.where(location: location).first_or_create!
  end

  def untrack_bike_station location
    user_bike_stations.where(location: location).delete_all
  end
end
