var lat, lng;

var geopositionHandler = function(geoposition) {

	lat = geoposition.coords.latitude
	lng = geoposition.coords.longitude
	
}

var makeMetroCommuterRequest= function(callback) {

	$.ajax({
		method: "GET",
		url: "/metro",
		data: {
			lat: latitude,
			long: longitude
		},
		success: function(data) {
			callback(data)
		}
	})
}

var makeBusCommuterRequest= function(callback) {

	$.ajax({
		method: "GET",
		url: "/buses",
		data: {
			lat: lat,
			long: lng
		},
		success: function(data) {
			callback(data)
		}
	})
}

var makeBikesCommuterRequest= function(callback) {

	console.log(lat, lng)

	$.ajax({
		method: "GET",
		url: "/bikes",
		data: {
			lat: lat,
			long: lng
		},
		success: function(data) {
			callback(data)
		}
	})
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

var addFavoriteStation= function(location, callback) {

	$.ajax({
		method: "PATCH",
		url: "/metro/" + location + "/favorite",
		data: {

		},
		success: function(data) {
			callback(data)
		}
	})
}

var deleteFavoriteStation= function(location, callback) {

	$.ajax({
		method: "PATCH",
		url: "/metro/" + location + "/unfavorite",
		data: {

		},
		success: function(data) {
			callback(data)
		}
	})
}

var addFavoriteBus= function(location, callback) {

	$.ajax({
		method: "PATCH",
		url: "/buses/" + location + "/favorite",
		data: {

		},
		success: function(data) {
			callback(data)
		}
	})
}

var deleteFavoriteBus= function(location, callback) {

	$.ajax({
		method: "PATCH",
		url: "/buses/" + location + "/unfavorite",
		data: {

		},
		success: function(data) {
			callback(data)
		}
	})
}

var addFavoriteBike= function(location, callback) {

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

var instantiateViews = function(data) {

	views.station = new LocalBikeStationInfo({
		address: "23rd & Crystal Dr",
		availableBikes: 5,
		availableDocks: 12
	})

	$("#favBikeContainer").append(views.station.$el)

}

navigator.geolocation.getCurrentPosition(geopositionHandler)

