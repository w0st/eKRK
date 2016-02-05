'use strict';

(function() {

	/**
	* @ngdoc function
	* @name app.service:zajeciaService
	* @description
	* # zajeciaService
	* Service of the app
	*/
angular
		.module('zajecia')
		.factory('ZajeciaService', Zajecia);
		// Inject your dependencies as .$inject = ['$http', 'someSevide'];
		// function Name ($http, someSevide) {...}

		Zajecia.$inject = ['CONFIG', '$resource'];

		function Zajecia (CONFIG, $resource) {
            return {
                    getKursy: function(id) {
                        return $resource(CONFIG.API_URL + "przedmioty_ksztalcenia/:id/kursy",
                            { id: '@id' },
                            {'get': {method: 'GET', isArray: true}}
                        ).get({id: id}).$promise;
                    },
                    deleteZajecie: function(id) {
                        return $resource(CONFIG.API_URL + 'zajecia/:id',
                            {id: '@id'},
                            {'delete': {method: 'DELETE'}}
                        ).delete({id: id}).$promise;
                    }
            };

		}

})();
