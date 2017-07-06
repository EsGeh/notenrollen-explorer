(function(){
	
	var DO_AUTH = true;
	
	var ADDRESS = 'http://localhost:8000/';
	
	var app = angular.module('notenroller', []);

	app.config(function($interpolateProvider) {
		$interpolateProvider.startSymbol('{[{');
		$interpolateProvider.endSymbol('}]}');
	});	

	app.controller('PageController', ['$http', function($http) {
		
//		this.keys = Object.keys(this.notenrollen);
//		this.objectId = 1;
//		this.notenrolle = this.notenrollen[id];
//		var page = this;
//		
//		page.notenrollen = [];
//		
//		$http.get('').success(function(data) {
//			
//			page.notenrollen = data;
//			
//		});
		
		this.notenrollen = [	{"title":"Valse Cis-moll, Op. 64. No. 2",
										"type":"Notenrolle",
										"instrument":"Klavier",
										"hersteller":"M. Welte &amp; Söhne (Freiburg im Breisgau)",
										"componist":"Chopin, Frédéric",
										"interpret":"Dohnányi, Ernst von",
										"images": [
											"images/notenrollen/1974-50T1_1.jpg",
											"images/notenrollen/1974-50T1_2.jpg",
											"images/notenrollen/1974-50T1_3.jpg",
										],
										"description1":"Beginn Perforierung hs. mit Bleistift: 498",
										"description2":"Mitnehmer rechts, Laufrichtung aufwärts. Rotes Papier.",
										"id":"1"},
								
										{"title":"Die Nachtigall",
										"type":"Notenrolle",
										"instrument":"Klavier",
										"hersteller":"M. Welte &amp; Söhne (Freiburg im Breisgau)",
										"componist":"Aljab'ev, Aleksandr Aleksandrovič; Liszt, Franz",
										"interpret":"Maurina, Vera",
										"images": [
											"images/notenrollen/1974-50T1_1.jpg",
											"images/notenrollen/1974-50T1_2.jpg",
											"images/notenrollen/1974-50T1_3.jpg",
										],
										"description1":"Beginn Perforierung hs. mit Bleistift: 498",
										"description2":"Mitnehmer rechts, Laufrichtung aufwärts. Rotes Papier.",
										"id":"2"},
								
								{	"title":"Staccato-Caprice",
									"type":"Notenrolle",
									"instrument":"Klavier",
									"hersteller":"M. Welte &amp; Söhne (Freiburg im Breisgau)",
									"componist":"Vogrich, Max",
									"interpret":"Merö, Yolanda",
									"images": [
										"images/notenrollen/1974-50T1_1.jpg",
										"images/notenrollen/1974-50T1_2.jpg",
										"images/notenrollen/1974-50T1_3.jpg",
									],
									"description1":"Beginn Perforierung hs. mit Bleistift: 498",
									"description2":"Mitnehmer rechts, Laufrichtung aufwärts. Rotes Papier.",
									"id":"3"},
								{	"title":"Valse Cis-moll, Op. 64. No. 2",
									"type":"Notenrolle",
									"instrument":"Klavier",
									"hersteller":"M. Welte &amp; Söhne (Freiburg im Breisgau)",
									"componist":"Chopin, Frédéric",
									"interpret":"Dohnányi, Ernst von",
									"images": [
										"images/notenrollen/1974-50T1_1.jpg",
										"images/notenrollen/1974-50T1_2.jpg",
										"images/notenrollen/1974-50T1_3.jpg",
									],
									"description1":"Beginn Perforierung hs. mit Bleistift: 498",
									"description2":"Mitnehmer rechts, Laufrichtung aufwärts. Rotes Papier.",
									"id":"4"},
								
								{	"title":"Die Nachtigall",
									"type":"Notenrolle",
									"instrument":"Klavier",
									"hersteller":"M. Welte &amp; Söhne (Freiburg im Breisgau)",
									"componist":"Aljab'ev, Aleksandr Aleksandrovič; Liszt, Franz",
									"interpret":"Maurina, Vera",
									"images": [
										"images/notenrollen/1974-50T1_1.jpg",
										"images/notenrollen/1974-50T1_2.jpg",
										"images/notenrollen/1974-50T1_3.jpg",
									],
									"description1":"Beginn Perforierung hs. mit Bleistift: 498",
									"description2":"Mitnehmer rechts, Laufrichtung aufwärts. Rotes Papier.",
									"id":"5"},
								
								{	"title":"Staccato-Caprice",
										"type":"Notenrolle",
										"instrument":"Klavier",
										"hersteller":"M. Welte &amp; Söhne (Freiburg im Breisgau)",
										"componist":"Vogrich, Max",
										"interpret":"Merö, Yolanda",
										"images": [
											"images/notenrollen/1974-50T1_1.jpg",
											"images/notenrollen/1974-50T1_2.jpg",
											"images/notenrollen/1974-50T1_3.jpg",
										],
										"description1":"Beginn Perforierung hs. mit Bleistift: 498",
										"description2":"Mitnehmer rechts, Laufrichtung aufwärts. Rotes Papier.",
										"id":"6"},
		]
	
	}]);

})();

