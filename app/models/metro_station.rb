class MetroStation < ActiveRecord::Base

  include HTTParty
  base_uri "https://api.wmata.com/Rail.svc/json"
  API_KEY="kfgpmgvfgacx98de9q3xazww"

  def self.save_all_from_api!
    stations = get "/jStations?LineCode&api_key=#{API_KEY}"
    data = stations["Stations"]
    data.each do |d|   # d["Name"]
      MetroStation.where(station_code: d["Code"], station_name: d["Name"], longitude: d["Lon"], latitude: d["Lat"]).first_or_create!
    end
  end

  # def initialize
  #   # lat, long
  #   # lines that actually go through this station
  # end

end

# HTTParty.get "https://api.wmata.com/Rail.svc/json/jStationInfo?StationCode=C15&api_key=kfgpmgvfgacx98de9q3xazww"
# HTTParty.get "https://api.wmata.com/Rail.svc/json/jStations?LineCode&api_key=kfgpmgvfgacx98de9q3xazww"

