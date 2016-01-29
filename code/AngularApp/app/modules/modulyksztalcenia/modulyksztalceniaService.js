'use strict';

(function() {

	/**
	* @ngdoc function
	* @name app.service:modulyksztalceniaService
	* @description
	* # modulyksztalceniaService
	* Service of the app
	*/
angular
		.module('modulyksztalcenia')
		.factory('ModulyKsztalceniaService', ModulyKsztalcenia);
		// Inject your dependencies as .$inject = ['$http', 'someSevide'];
		// function Name ($http, someSevide) {...}

		ModulyKsztalcenia.$inject = ['$http'];

		function ModulyKsztalcenia ($http) {

		}

})();
