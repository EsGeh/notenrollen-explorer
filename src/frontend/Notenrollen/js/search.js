(function(){
	
	var DO_AUTH = true;
	
	var ADDRESS = 'http://localhost:8000/';
	
	var app = angular.module('PaM', []);
	
	app.controller('NotenrollenController',function(){
		this.notenrollen = [{	"title":"Valse Cis-moll, Op. 64. No. 2",
								"type":"Notenrolle",
								"instrument":"Klavier",
								"hersteller":"M. Welte &amp; Söhne (Freiburg im Breisgau)",
								"componist":"Chopin, Frédéric",
								"interpret":"Dohnányi, Ernst von"},
								
							{	"title":"Die Nachtigall",
								"type":"Notenrolle",
								"instrument":"Klavier",
								"hersteller":"M. Welte &amp; Söhne (Freiburg im Breisgau)",
								"componist":"Aljab'ev, Aleksandr Aleksandrovič; Liszt, Franz",
								"interpret":"Maurina, Vera"},
								
							{	"title":"Staccato-Caprice",
								"type":"Notenrolle",
								"instrument":"Klavier",
								"hersteller":"M. Welte &amp; Söhne (Freiburg im Breisgau)",
								"componist":"Vogrich, Max",
								"interpret":"Merö, Yolanda"}];
	});

})();

