class MetroInfo
  include HTTParty
  base_uri "https://api.wmata.com"
  API_KEY = ENV["WMATA_API_KEY"] # Demo key - kfgpmgvfgacx98de9q3xazww

  def self.stations
    response = get "/Rail.svc/json/jStations?LineCode&api_key=#{API_KEY}"
    stations = response["Stations"]
  end

  def self.arrival (station_code) # change to splat? take multiple station codes
    response = get "/StationPrediction.svc/json/GetPrediction/#{station_code}?api_key=#{API_KEY}"  
    train = response["Trains"]
    if train == nil
      raise "No train: #{response}"
    end
    info = []
    train.each do |t|
      x = {line: t["Line"], arrival: t["Min"], destination: t["DestinationName"]}
      info<<x
    end
    info
  # rescue
  #   binding.pry
  #   raise
  end

end

# response = get "/jStations?api_key=#{API_KEY}&LineCode=#{line}"
# response = get "/jStationInfo?api_key=#{API_KEY}&StationCode=#{station_code}"

# HTTParty.get "https://api.wmata.com/Rail.svc/json/jStationInfo?StationCode=C15&api_key=kfgpmgvfgacx98de9q3xazww"
# HTTParty.get "https://api.wmata.com/Rail.svc/json/jStations?LineCode&api_key=kfgpmgvfgacx98de9q3xazww"