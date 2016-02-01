'use strict';

(function() {

	/**
	* @ngdoc function
	* @name app.service:modulksztalceniaService
	* @description
	* # modulksztalceniaService
	* Service of the app
	*/
angular
		.module('modulksztalcenia')
		.factory('ModulksztalceniaService', Modulksztalcenia);
		// Inject your dependencies as .$inject = ['$http', 'someSevide'];
		// function Name ($http, someSevide) {...}

		Modulksztalcenia.$inject = ['$resource', 'CONFIG', '$http'];

		function Modulksztalcenia ($resource, CONFIG, $http) {
            return {
                getModulKsztalcenia: function (id) {
                    return $resource(CONFIG.API_URL + "moduly_ksztalcenia/:id").get({id: id}).$promise;
                },

                getProfileForPK: function(pkID) {
                    return $resource(CONFIG.API_URL + "profile_modulow/program_ksztalcenia_pk/:id").query({id: pkID}).$promise;
                },

                updateModulKsztalcenia: function(modulKsztalcenia){
                    $http.put(CONFIG.API_URL + "moduly_ksztalcenia", modulKsztalcenia);
                },

                addModulKsztalcenia: function(modulKsztalcenia){
                    console.log(modulKsztalcenia);
                    $http.post(CONFIG.API_URL + "moduly_ksztalcenia", modulKsztalcenia);
                }
            }
		}

})();
