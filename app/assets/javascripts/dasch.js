var makeMetroCommuterRequest= function(latitude, longitude, callback) {

	$.ajax({
		method: "GET",
		url: "/metro",
		data: {

		},
		success: function(data) {
			callback(data)
		}
	})
}


var lat, lng;

var geopositionHandler = function(geoposition) {

	lat = geoposition.coords.latitude
	lng = geoposition.coords.longitude
	
}

var makeBusCommuterRequest= function(latitude, longitude, callback) {

	$.ajax({
		method: "GET",
		url: "/buses",
		data: {

		},
		success: function(data) {
			callback(data)
		}
	})
}

var userStopLocation = function(geoposition) {
	makeBusCommuterRequest(
		geoposition.coords.latitude,
		geoposition.coords.longitude,

	)
}

var makeBikesCommuterRequest= function(latitude, longitude, callback) {

	$.ajax({
		method: "GET",
		url: "/bikes",
		data: {

		},
		success: function(data) {
			callback(data)
		}
	})
}

var userBikeLocation = function(geoposition) {
	makeBikesCommuterRequest(
		geoposition.coords.latitude,
		geoposition.coords.longitude,

	)
}

var favoriteMetro= function(callback) {

	$.ajax({
		method: "GET",
		url: "/favorites/metro",
		data: {

		},
		success: function(data) {
			callback(data)
		}
	})
}

var favoriteBuses= function(callback) {

	$.ajax({
		method: "GET",
		url: "/favorites/buses",
		data: {

		},
		success: function(data) {
			callback(data)
		}
	})
}

var favoriteBikes= function(callback) {

	$.ajax({
		method: "GET",
		url: "/favorites/bikes",
		data: {

		},
		success: function(data) {
			callback(data)
		}
	})
}

var addFavoriteStation= function(callback) {

	$.ajax({
		method: "PATCH",
		url: "/metro/:station/favorite",
		data: {

		},
		success: function(data) {
			callback(data)
		}
	})
}

var deleteFavoriteStation= function(callback) {

	$.ajax({
		method: "PATCH",
		url: "/metro/:station/unfavorite",
		data: {

		},
		success: function(data) {
			callback(data)
		}
	})
}

var addFavoriteBus= function(callback) {

	$.ajax({
		method: "PATCH",
		url: "/buses/:stop/favorite",
		data: {

		},
		success: function(data) {
			callback(data)
		}
	})
}

var deleteFavoriteBus= function(callback) {

	$.ajax({
		method: "PATCH",
		url: "/buses/:stop/unfavorite",
		data: {

		},
		success: function(data) {
			callback(data)
		}
	})
}

var addFavoriteBike= function(callback) {

	$.ajax({
		method: "PATCH",
		url: "/bikes/:location/favorite",
		data: {

		},
		success: function(data) {
			callback(data)
		}
	})
}

var deleteFavoriteBike= function(location, callback) {

	$.ajax({
		method: "PATCH",
		url: "/bikes/" + location + "/favorite",
		data: {

		},
		success: function(data) {
			callback(data)
		}
	})
}









$(document).on("ready", function(){

  console.log("ready")

  

})