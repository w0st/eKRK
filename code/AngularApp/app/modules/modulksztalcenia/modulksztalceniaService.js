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

                getZajeciaForModule: function(pkID, moduleID)  {
                    return $resource(CONFIG.API_URL + "zajecia/from_module").query({program_ksztalcenia_id: pkID, modul_ksztalcenia_id: moduleID}).$promise;
                },

                updateModulKsztalcenia: function(modulKsztalcenia){
                    return $http.put(CONFIG.API_URL + "moduly_ksztalcenia", modulKsztalcenia);
                },

                addModulKsztalcenia: function(modulKsztalcenia) {
                    return $http.post(CONFIG.API_URL + "moduly_ksztalcenia", modulKsztalcenia);
                },
                assignZajecia: function(array) {
                    return $http.put(CONFIG.API_URL + "moduly_ksztalcenia/przypisz_zajecia", array);
                }

            }
		}

})();
