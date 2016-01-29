'use strict';

(function() {

	/**
	* @ngdoc function
	* @name app.controller:modulyksztalceniaCtrl
	* @description
	* # modulyksztalceniaCtrl
	* Controller of the app
	*/
	angular
		.module('modulyksztalcenia')
		.controller('ModulyKsztalceniaCtrl', ModulyKsztalcenia);

		ModulyKsztalcenia.$inject = [];

		/*
		* recommend
		* Using function declarations
		* and bindable members up top.
		*/

		function ModulyKsztalcenia() {
			/*jshint validthis: true */
			var vm = this;

                $('.table').DataTable({
                    responsive: true

                });


		}



})();
