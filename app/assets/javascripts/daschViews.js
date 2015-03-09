var templates;
var views = {}






$(document).on("ready", function(){

var getTemplates = function() {

	templates = {
		localMetro: Handlebars.compile( $("#localMetroTemplate").text() ),
		localBike: Handlebars.compile( $("#localBikeTemplate").text() ),
		localBus: Handlebars.compile( $("#localBusTemplate").text() ),
		favMetro: Handlebars.compile( $("#favMetroTemplate").text() ),
		favBike: Handlebars.compile( $("#favBikeTemplate").text() ),
		favBus: Handlebars.compile( $("#favBusTemplate").text() ),
		}
	}
})