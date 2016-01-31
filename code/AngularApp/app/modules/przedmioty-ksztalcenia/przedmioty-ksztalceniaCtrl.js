'use strict';

(function() {

	/**
	* @ngdoc function
	* @name app.controller:przedmioty-ksztalceniaCtrl
	* @description
	* # przedmioty-ksztalceniaCtrl
	* Controller of the app
	*/
	angular
		.module('przedmioty-ksztalcenia')
		.controller('PrzedmiotyKsztalceniaCtrl', PrzedmiotyKsztalcenia);

        PrzedmiotyKsztalcenia.$inject = ['PrzedmiotyKsztalceniaService'];

		/*
		* recommend
		* Using function declarations
		* and bindable members up top.
		*/

		function PrzedmiotyKsztalcenia(PrzedmiotyKsztalceniaService) {
			/*jshint validthis: true */
			var vm = this;

            PrzedmiotyKsztalceniaService.get().$promise.then(function (response) {
                vm.przedmiotyKsztalcenia = response;
            }, function (reason) {
                console.log("problem = ", reason);
            });

            /*PrzedmiotyKsztalceniaService.add( {
                nazwaPrzedmiotu: "Angielski B2",
                program_ksztalcenia_id: 1,
                pracownik_naukowy_id: 1
            }).$promise.then(function(response) {

            }, function(reason) {

            });

            PrzedmiotyKsztalceniaService.delete({
                id: 4
            }).$promise.then(function (response) {
                console.log('usunieto');
            }, function (reason) {
                console.log('problem = ', reason);
            });*/
		}

})();
