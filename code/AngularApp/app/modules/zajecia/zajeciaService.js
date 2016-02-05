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

		Zajecia.$inject = ['$http'];

		function Zajecia ($http) {

		}

})();
