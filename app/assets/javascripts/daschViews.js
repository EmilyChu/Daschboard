var templates = {}

var views = {}

var LocalBikeStationInfo = Backbone.View.extend({

	events: {
		"click .update-button": "updateCoordinates"
	},

	tagName: "div",

	className: "station-view",

	initialize: function(data) {
		this.render(data)
	},

	render: function(data) {
		this.$el.html( templates.localBike(data) )
	},

	updateCoordinates: function() {
		var latitude = this.$el.find(".latitude").val()
		var longitiude = this.$el.find(".longitude").val()

		this.trigger("update-coordinates", latitude, longitude)
	}

})




$(document).on("ready", function(){

	templates = {
		localMetro: Handlebars.compile( $("#localMetroTemplate").text() ),
		localBike: Handlebars.compile( $("#localBikeTemplate").text() ),
		localBus: Handlebars.compile( $("#localBusTemplate").text() ),
		favMetro: Handlebars.compile( $("#favMetroTemplate").text() ),
		favBike: Handlebars.compile( $("#favBikeTemplate").text() ),
		favBus: Handlebars.compile( $("#favBusTemplate").text() ),
	}

	instantiateViews()

})
/*
	makeBikesCommuterRequest(function(data){
		console.log(data)
	})

})
*/
