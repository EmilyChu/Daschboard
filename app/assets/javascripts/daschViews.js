var templates = {}

var views = {}

var LocalMetroStationInfo = Backbone.View.extend({

	tagName: "div",

	className: "station-view",

	initialize: function(data) {
		this.render(data)
	},

	render: function(data) {
		this.$el.html( templates.localMetro(data) )
	},
})

var LocalBikeStationInfo = Backbone.View.extend({

	events: {
		"click .favorite-button": "favBike"
	},

	tagName: "div",

	className: "station-view",

	initialize: function(data) {
		this.render(data)
	},

	render: function(data) {
		this.$el.html( templates.localMetro(data) )
	},
})

var LocalBusRouteInfo = Backbone.View.extend({

	tagName: "div",

	className: "station-view",

	initialize: function(data) {
		this.render(data)
	},

	render: function(data) {
		this.$el.html( templates.localBus(data) )
	},
})

var FavMetroStationInfo = Backbone.View.extend({

	tagName: "div",

	className: "station-view",

	initialize: function(data) {
		this.render(data)
	},

	render: function(data) {
		this.$el.html( templates.favMetro(data) )
	},
})

var FavBikeStationInfo = Backbone.View.extend({

	tagName: "div",

	className: "station-view",

	initialize: function(data) {
		this.render(data)
	},

	render: function(data) {
		this.$el.html( templates.favBike(data) )
	},
})

var FavBusStopInfo = Backbone.View.extend({

	tagName: "div",

	className: "station-view",

	initialize: function(data) {
		this.render(data)
	},

	render: function(data) {
		this.$el.html( templates.favBus(data) )
	},
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
