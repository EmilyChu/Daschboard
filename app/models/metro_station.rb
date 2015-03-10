class MetroStation < ActiveRecord::Base

  def self.save_all_from_api!
    stations = MetroInfo.stations
    stations.each do |s|
      MetroStation.where(station_code: s["Code"], station_name: s["Name"], 
      longitude: s["Lon"], latitude: s["Lat"]).first_or_create!
    end
  end

  def distance_to lat, long
    Haversine.distance(self.latitude, self.longitude, Float(lat), Float(long)).to_miles
  end

  def self.closest_to opts={}
    lat, long = opts.fetch(:lat), opts.fetch(:long)
    limit = opts[:limit] || 10

    available = MetroStation.all.sort_by { |m| m.distance_to lat, long} 

    if opts[:radius]
      available.reject! { |m| m.distance_to(lat, long) > opts[:radius] }
    end
    available.first limit
  end

end
