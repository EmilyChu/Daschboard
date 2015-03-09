class BikeStation
  attr_reader :bike_share_id, :location, :available, :open

  def self.closest_to opts={}
    lat, long = opts.fetch(:lat), opts.fetch(:long)
    limit = opts[:limit] || 10

    found = BikeShare.stations.sort_by { |s| s.distance_to lat, long }
    if opts[:radius]
      found.reject! { |s| s.distance_to(lat, long) > opts[:radius] }
    end
    found.first limit
  end

  def initialize api_data
    @bike_share_id = api_data.fetch("id")
    @location      = api_data.fetch("name")

    @available = Integer api_data.fetch("nbBikes")
    @open      = Integer api_data.fetch("nbEmptyDocks")

    @lat  = Float api_data.fetch("lat")
    @long = Float api_data.fetch("long")
  end

  def distance_to lat, long
    Haversine.distance(@lat, @long, lat, long).to_miles
  end
end
