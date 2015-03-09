json.array! @stations do |station|
  json.(station, :location, :available, :open)
end
