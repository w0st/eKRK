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
		.module('modulksztalcenia')
		.controller('ModulksztalceniaCtrl', Modulksztalcenia);

		Modulksztalcenia.$inject = ['ModulksztalceniaService', '$scope', '$location'];

		/*
		* recommend
		* Using function declarations
		* and bindable members up top.
		*/

		function Modulksztalcenia(ModulksztalceniaService, $scope, $location) {
			/*jshint validthis: true */
			var vm = this;
            var moduleID;
            var moduleID = $location.search()['modul-id'];
            var initialModuleData;

            this.selectedZajeciaToAdd = [];
            this.selectedZajeciaToRemove = [];

            $scope.isSaveAlertCollapsed=true;
            console.log('moduleID ' + moduleID);

            this.isEditMode = function (tabId) {
                return moduleID != undefined;
            };

            ModulksztalceniaService.getZajeciaForModule(1, null).then(function(result){
                console.log('Zajecia bez modulu')
                console.log((result))
                vm.zajaciaWithoutModule = result;
            }, function(reason) {
                vm.error = reason;
            });

            ModulksztalceniaService.getProfileForPK(1).then(function(result){
                console.log(result)
                $scope.profile= result;

            }, function(reason) {
                vm.error = reason;
            });


            if(this.isEditMode()){
                console.log('request for moduleID '+ moduleID);
                ModulksztalceniaService.getModulKsztalcenia(moduleID).then(function(result){
                    console.log(result)
                    initialModuleData = angular.copy(result);
                    $scope.modul= result;
                    //hack - domyslna wartosc sie nie ustawiala bo była brana jako int a nie string
                    $scope.modul.profil_modulu_id = $scope.modul.profil_modulu_id+"";

                }, function(reason) {
                    vm.error = reason;
                });
                ModulksztalceniaService.getZajeciaForModule(1,moduleID).then(function(result){
                    console.log('Zajecia dla modulu')
                    console.log(result)
                    vm.module_zajecia = result;

                }, function(reason) {
                    vm.error = reason;
                })

            }
            else {
                // set default values
                $scope.modul = {typ: "Obowiazkowy", program_studiow_id: 1, profil_modulu_id: "1", nazwaModulu: "", minEcts: 1}
                vm.module_zajecia = [];
                //$scope.modul.minEcts = 1;
            }

            $scope.reset = function() {
                console.log("reset initial data");
                $scope.modul = angular.copy(initialModuleData);
                $scope.modul.profil_modulu_id = $scope.modul.profil_modulu_id+"";
            }

            this.submit = function() {
                if(this.isEditMode()) {
                    console.log('edytuj nowy modul ksztalcenia');
                    ModulksztalceniaService.updateModulKsztalcenia($scope.modul);
                    $scope.assignZajeciaToModule($scope.modul.id);
                    $scope.isSaveAlertCollapsed = false;
                }
                else {
                    ModulksztalceniaService.addModulKsztalcenia($scope.modul).then(function (res) {
                            console.log("Add new modul");
                            console.log(res.data.id);
                            $scope.modul.id = res.data.id;
                            $scope.assignZajeciaToModule($scope.modul.id);
                            $scope.isSaveAlertCollapsed = false;
                        },
                        function (err) {
                            console.log("THERE WAS AN ERROR");
                        });
                }
            }


            $scope.assignZajeciaToModule = function(modulId) {
                var zajeciaIdArray = [];
                vm.module_zajecia.forEach(function(zajecia){
                    zajeciaIdArray.push(zajecia.id);
                });

                var moduleZajecia = {
                    "zajecia": zajeciaIdArray,
                    "id": modulId
                };
                console.log(moduleZajecia);
                ModulksztalceniaService.assignZajecia(moduleZajecia);
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
