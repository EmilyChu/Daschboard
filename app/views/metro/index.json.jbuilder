#json.array! @stations do |station|
#  json.first_key "Some value"
#  json.adding    1+2
#end

#json.(@stations, :station_code, :station_name)
# json.station_code @stations.station_code <= doesn't work, no station_code

#json.array! @stations do |station|
#  json.station_code station.station_code
#  json.station_name station.station_name
#  json.latitude     station.latitude
#  json.longitude    station.longitude
#end

# example
#json.array! @next do |arrivals|
#  json.station_name "Something"
#  json.trains arrivals do |train|
#    json.line         train[:line]
#    json.arrival      train[:arrival]
#    json.destination  train[:destination]
#  end

json.array! @next.each do |k, v|
  json.station_name   k
    v.each do |train|
    json.line         train[:line]
    json.arrival      train[:arrival]
    json.destination  train[:destination]
  end
end