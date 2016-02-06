'use strict';

(function() {

	/**
	* @ngdoc function
	* @name app.controller:grupa-kursowCtrl
	* @description
	* # grupa-kursowCtrl
	* Controller of the app
	*/
	angular
		.module('zajecia')
		.controller('GrupaKursowCtrl', GrupaKursow);

		GrupaKursow.$inject = ['PrzedmiotyKsztalceniaService', 'ZajeciaService', '$state', '$stateParams'];

		/*
		* recommend
		* Using function declarations
		* and bindable members up top.
		*/

		function GrupaKursow(PrzedmiotyKsztalceniaService, ZajeciaService, $state, $stateParams) {
			/*jshint validthis: true */
			var vm = this;
            var przedmiotKsztalceniaId = $stateParams['przedmiot-ksztalcenia-id'];
            var grupaKursowId = $stateParams['grupa-kursow-id'];

            vm.isEditMode = function () {
                return grupaKursowId != undefined;
            }

            PrzedmiotyKsztalceniaService.get({id: przedmiotKsztalceniaId}).$promise.then(function(response) {
                vm.przedmiot = response;
            }, function(reason) {
                console.log(reason);
            });

            if(vm.isEditMode()) {
                ZajeciaService.getGrupaKursow(przedmiotKsztalceniaId).then(function(response) {
                    console.log(response)
                    vm.grupaKursow = response;
                }, function(reason) {
                    console.log(reason);
                });

            }
            else {

            }

            vm.formyKursow = ZajeciaService.getFormyKursow();

            vm.sposobyZaliczenia = ZajeciaService.getSposobyZaliczenia();

            vm.rodzaje = ZajeciaService.getRodzajeKursu();

            vm.typy = ZajeciaService.getTypyKursu();


		}

})();
