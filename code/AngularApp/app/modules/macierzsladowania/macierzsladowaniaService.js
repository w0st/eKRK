'use strict';

(function() {

	/**
	* @ngdoc function
	* @name app.service:macierzsladowaniaService
	* @description
	* # macierzsladowaniaService
	* Service of the app
	*/
angular
		.module('macierzsladowania')
		.factory('MacierzSladowaniaService', MacierzSladowania);
		// Inject your dependencies as .$inject = ['$http', 'someSevide'];
		// function Name ($http, someSevide) {...}

		MacierzSladowania.$inject = ['$http'];

		function MacierzSladowania ($http) {

		}

})();
