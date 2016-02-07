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
            var createdKursIndex = -1;

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

            vm.addKursToGrupaKursow = function() {
                var newKurs = {grupa_kursow_id: vm.grupaKursow.id, przedmiot_ksztalcenia_id: przedmiotKsztalceniaId, id: createdKursIndex};
                createdKursIndex = createdKursIndex - 1;
                vm.grupaKursow.kursy.push(newKurs);
            }

            vm.deleteKurs = function(index) {
                vm.grupaKursow.kursy.splice(index, 1);
            }

            vm.save = function() {
                vm.grupaKursow.kurs_koncowy_id = vm.grupaKursow.kurs_koncowy.id
                console.log(vm.grupaKursow)
                ZajeciaService.updateGrupaKursow(vm.grupaKursow).then(function(response) {
                    console.log(response)
                   // vm.grupaKursow = response
                }, function(reason) {
                    console.log(reason);
                });
            }


		}

})();
