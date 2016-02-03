'use strict';

(function() {

	/**
	* @ngdoc function
	* @name app.controller:modulksztalceniaCtrl
	* @description
	* # modulksztalceniaCtrl
	* Controller of the app
	*/
	angular
		.module('modul-ksztalcenia')
		.controller('ModulKsztalceniaCtrl', ModulKsztalcenia);

		ModulKsztalcenia.$inject = ['ModulKsztalceniaService', '$scope', '$location'];

		/*
		* recommend
		* Using function declarations
		* and bindable members up top.
		*/

		function ModulKsztalcenia(ModulKsztalceniaService, $scope, $location) {
			/*jshint validthis: true */
			var vm = this;

            // id edytowanego modulu jesli brak dodajemy nowy modul
            var moduleID = $location.search()['modul-id'];

            // poczatkowe dane modulu do resetowania zmian
            var initialModuleData;


            vm.selectedZajeciaToAdd = [];
            vm.selectedZajeciaToRemove = [];

            vm.isSaveAlertCollapsed = true;
            console.log('moduleID ' + moduleID);

            this.isEditMode = function (tabId) {
                return moduleID != undefined;
            };

            ModulKsztalceniaService.getZajeciaForModule(1, null).then(function(result){
                console.log('Zajecia bez modulu')
                console.log((result))
                vm.zajaciaWithoutModule = result;
            }, function(reason) {
                vm.error = reason;
            });

            ModulKsztalceniaService.getProfileForPK(1).then(function(result){
                console.log(result)
                vm.profile= result;
            }, function(reason) {
                vm.error = reason;
            });


            if(this.isEditMode()){
                console.log('request for moduleID '+ moduleID);
                ModulKsztalceniaService.getModulKsztalcenia(moduleID).then(function(result){
                    console.log(result)
                    initialModuleData = angular.copy(result);
                    vm.modul= result;
                    //hack - domyslna wartosc sie nie ustawiala bo była brana jako int a nie string
                    vm.modul.profil_modulu_id = vm.modul.profil_modulu_id+"";

                }, function(reason) {
                    vm.error = reason;
                });
                ModulKsztalceniaService.getZajeciaForModule(1,moduleID).then(function(result){
                    console.log('Zajecia dla modulu')
                    console.log(result)
                    vm.module_zajecia = result;

                }, function(reason) {
                    vm.error = reason;
                })

            }
            else {
                // set default values
                vm.modul = {typ: "Obowiazkowy", program_studiow_id: 1, profil_modulu_id: "1", nazwaModulu: "", minEcts: 1}
                vm.module_zajecia = [];
                initialModuleData = angular.copy(vm.modul);
            }

            this.reset = function() {
                console.log("reset initial data");
                vm.modul = angular.copy(initialModuleData);
                vm.modul.profil_modulu_id = vm.modul.profil_modulu_id+"";
            }

            this.assignZajeciaToModule = function(modulId) {
                var zajeciaIdArray = [];
                vm.module_zajecia.forEach(function(zajecia){
                    zajeciaIdArray.push(zajecia.id);
                });

                var moduleZajecia = {
                    "zajecia": zajeciaIdArray,
                    "id": modulId
                };
                console.log(moduleZajecia);
                ModulKsztalceniaService.assignZajecia(moduleZajecia);
            }

            this.submit = function() {
                if(this.isEditMode()) {
                    console.log('edytuj nowy modul ksztalcenia');
                    ModulKsztalceniaService.updateModulKsztalcenia(vm.modul);
                    vm.assignZajeciaToModule(vm.modul.id);
                    vm.isSaveAlertCollapsed = false;
                }
                else {
                    ModulKsztalceniaService.addModulKsztalcenia(vm.modul).then(function (res) {
                            console.log("Add new modul");
                            console.log(res.data.id);
                            vm.modul.id = res.data.id;
                            vm.assignZajeciaToModule(vm.modul.id);
                            vm.isSaveAlertCollapsed = false;
                        },
                        function (err) {
                            console.log("THERE WAS AN ERROR");
                        });
                }
            }

            this.addZajeciaToModule = function() {
                console.log(vm.selectedZajeciaToAdd);
                this.moveItems(vm.selectedZajeciaToAdd, vm.zajaciaWithoutModule, vm.module_zajecia);
            }

            this.removeZajeciaFromModule = function() {
                console.log(this.selectedZajeciaToRemove);
                this.moveItems(vm.selectedZajeciaToRemove, vm.module_zajecia, vm.zajaciaWithoutModule);
            }

                this.moveItems = function(itemsToMove, listFrom, listTo) {
                    itemsToMove.forEach(
                        function(item){
                            listTo.push(item);
                            var index = listFrom.indexOf(item);
                            if(index != -1) {
                                listFrom.splice(index, 1);
                            }
                        });
                }

		}

})();
