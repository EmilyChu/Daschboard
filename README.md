# Daschboard

![Daschboard](http://dachshundfanclub.com/wp-content/uploads/2014/03/skate.jpg)

## API reference

``
GET /metro
- params: lat, long
- returns a list of stations, where each station looks like:
  { station: "Crystal City", trains: [ { line:, arrival:, destination: } ] }
GET /buses
- params: lat, long
- returns a list of stops, where each stop looks like:
  { stop: "...", buses: [ { route:, arrival:, destination: }, ... ] }
GET /bikes
- params: lat, long
- returns: [ { location:, available:, open: }, ... ]

GET /favorites/metro
GET /favorites/buses
GET /favorites/bikes
- details similar to the above, but no location given

PATCH /metro/:station/favorite
PATCH /metro/:station/unfavorite
PATCH /buses/:stop/favorite
PATCH /buses/:stop/unfavorite
PATCH /bikes/:location/favorite
PATCH /bikes/:location/unfavorite
```
