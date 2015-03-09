class BikeShare
  include HTTParty
  base_uri "http://www.capitalbikeshare.com"

  def self.stations
    response = get "/data/stations/bikeStations.xml"
    response["stations"]["station"].map { |s| BikeStation.new s }
  end
end
