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

		GrupaKursow.$inject = ['PrzedmiotyKsztalceniaService', 'ZajeciaService', '$state', '$stateParams', '$timeout'];

		/*
		* recommend
		* Using function declarations
		* and bindable members up top.
		*/

		function GrupaKursow(PrzedmiotyKsztalceniaService, ZajeciaService, $state, $stateParams, $timeout) {
			/*jshint validthis: true */
			var vm = this;
            var przedmiotKsztalceniaId = $stateParams['przedmiot-ksztalcenia-id'];
            var grupaKursowId = $stateParams['grupa-kursow-id'];
            var createdKursIndex = -1;
            vm.przedmiotKsztalceniaId = przedmiotKsztalceniaId

            vm.isEditMode = function () {
                return grupaKursowId != undefined;
            }

            vm.addKursToGrupaKursow = function() {
                var newKurs = { przedmiot_ksztalcenia_id: przedmiotKsztalceniaId, id: createdKursIndex};
                createdKursIndex = createdKursIndex - 1;
                vm.grupaKursow.kursy.push(newKurs);
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
                vm.grupaKursow = {kursy: []}
                vm.addKursToGrupaKursow()
                vm.grupaKursow.kurs_koncowy = vm.grupaKursow.kursy[0]
            }

            vm.formyKursow = ZajeciaService.getFormyKursow();

            vm.sposobyZaliczenia = ZajeciaService.getSposobyZaliczenia();

            vm.rodzaje = ZajeciaService.getRodzajeKursu();

            vm.typy = ZajeciaService.getTypyKursu();

            vm.deleteKurs = function(index) {
                vm.grupaKursow.kursy.splice(index, 1);
            }

            vm.save = function() {
                console.log('grupa kursow = ', vm.grupaKursow)
                if (vm.checkGrupaKursow(vm.grupaKursow)) {
                    if(vm.isEditMode()) {
                        vm.updateGrupaKursow();
                    }
                    else {
                        vm.addGrupaKursow()
                    }
                }

            }

            vm.checkGrupaKursow = function(grupaKursow) {
                console.log('Grupa kursow = ', grupaKursow);
                vm.validations = {
                    'grupa_kursow_no_final_course': _.some(grupaKursow.kursy, function(kurs) {
                        return _.isUndefined(grupaKursow.kursKoncowy) || kurs.id !== grupaKursow.kurs_koncowy.id
                    }),
                    'grupa_kursow_no_courses': grupaKursow.kursy !== null && grupaKursow.kursy.length > 0
                };
                return _.some(vm.validations, false);
            };

            vm.updateGrupaKursow = function() {
                vm.grupaKursow.kurs_koncowy_id = vm.grupaKursow.kurs_koncowy.id
                console.log(vm.grupaKursow)
                ZajeciaService.updateGrupaKursow(vm.grupaKursow).then(function(response) {
                    console.log(response)
                    vm.dispaySuccessAlert()
                }, function(reason) {
                    console.log(reason);
                });
            }

            vm.addGrupaKursow = function() {
                vm.grupaKursow.kurs_koncowy_id = vm.grupaKursow.kurs_koncowy.id
                vm.grupaKursow.przedmiot_ksztalcenia_id = przedmiotKsztalceniaId
                console.log(vm.grupaKursow)
                ZajeciaService.addGrupaKursow(vm.grupaKursow).then(function(response) {
                    console.log(response)
                    vm.dispaySuccessAlert()
                }, function(reason) {
                    console.log(reason);
                });
            }

            vm.dispaySuccessAlert = function() {
                vm.isUpdateAlertVisible = true
                $timeout(function() {
                    vm.isUpdateAlertVisible = false
                }, 3000)
            }


		}

})();
