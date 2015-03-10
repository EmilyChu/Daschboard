json.array! @stations do |station|
  json.(station, :line, :arrival, :location)
end