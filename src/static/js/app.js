(function(){
	
	var DO_AUTH = true;
	
	var ADDRESS = 'http://localhost:8000/';

	jQuery(document).ready(function($) {
    		$(".clickable-row").click(function() {
       			 window.location = $(this).data("href");
    		});
	});
	
//	var restServices = angular.module('notenrollenexplorer.rest_services', ['ngResource']);	
//	restServices = restServices.factory('NotenrollenService', function($http){
//		return {
//		    notenrollen: function (callback) {
//		        $http.get(
//		        	'test.xml', 
//		        	{transformResponse:function(data) {
//                    // convert the data to JSON and provide
//                    // it to the success function below
//		        		var x2js = new X2JS();
//		        		var json = x2js.xml_str2json( data );
//		        		return json;
//                    	}
//		        	}
//		        ).
//                success(function(data, status) {
//                    // send the converted data back
//                    // to the callback function
//                    callback(data);
//                })
//		    }
//		}
//	});
	
	var app = angular.module('notenrollenexplorer', []);
	app.config(function($interpolateProvider){
		$interpolateProvider.startSymbol('{[{').endSymbol('}]}');
	});
	
	app.controller('SearchController', function($http) {
		
		var page = this;
		
		page.notenrollen = [];
		
        $http.get(ADDRESS + "search_database",
                {
                    transformResponse: function (cnv) {
                        var x2js = new X2JS();
                        var aftCnv = x2js.xml_str2json(cnv);
                        return aftCnv;
                    }
                })
        .then(function (response) {
            page.notenrollen = response.data.notenrollen.object;
        });

        this.getId = function(notenrolle) {
        	if(notenrolle.id != notenrolle.id) {
        		return notenrolle.id;
        	} else {
        		return "-1";
        	}
        }
        
        this.getTitle = function(notenrolle) {
        	return notenrolle.descriptiveMetadata.title;
//        	var title = notenrolle.descriptiveMetdata.title;
//        	if(title != title) {
//        		return title;
//        	} else {
//        		return "-";
//        	}
        }
        
        this.getInstrument = function(notenrolle) {
        	return notenrolle.descriptiveMetadata.instrument
//        	var instrument = notenrolle.descriptiveMetadata.instrument;
//        	if(instrument != instrument) {
//        		return instrument;
//        	} else {
//        		return "-";
//        	}
        }
        
        this.getComponist = function(notenrolle) {
        	var componist = notenrolle.actors.Komponist;
        	if(typeof componist === 'string') {
        		return componist;
        	} else if(Object.prototype.toString.call( componist ) === '[object Array]') {
        		var strComponists = '';
        		for(i = 0; i < componist.length; i++) {
        			strComponists += strComponists + componist[i] + "; "
        		}
        		return strComponists;
        	} else {
        		"-";
        	}
        }
        
        this.getInterpret = function(notenrolle) {
        	var interpret = notenrolle.actors.Interpret;
        	if(typeof interpret === 'string') {
        		return interpret;
        	} else if(Object.prototype.toString.call( interpret ) === '[object Array]') {
        		var strInterprets = '';
        		for(i = 0; i < interpret.length; i++) {
        			strInterprets += strInterprets + interpret[i] + "; "
        		}
        		return strInterprets;
        	} else {
        		"-";
        	}
        }	
        
	});

	app.controller('ExploreController', function($http) {
		
		page.current;

	});

})();

