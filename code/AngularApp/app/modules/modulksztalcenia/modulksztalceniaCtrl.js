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
            $scope.isSaveAlertCollapsed=true;
            console.log('moduleID ' + moduleID);

            $scope.isEditMode = function (tabId) {
                return moduleID != undefined;
            };

            ModulksztalceniaService.getProfileForPK(1).then(function(result){
                console.log(result)
                $scope.profile= result;

            }, function(reason) {
                vm.error = reason;
            });


            if($scope.isEditMode()){
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
            }
            else {
                // set default values
                $scope.modul = {typ: "Obowiazkowy", program_studiow_id: 1, profil_modulu_id: "1", nazwaModulu: "", minEcts: 1}
                //$scope.modul.minEcts = 1;
            }

            $scope.reset = function() {
                console.log("reset initial data");
                $scope.modul = angular.copy(initialModuleData);
                $scope.modul.profil_modulu_id = $scope.modul.profil_modulu_id+"";
            }

            $scope.submit = function() {
                if($scope.isEditMode()) {
                    console.log('dodaj nowy modul ksztalcenia');
                    ModulksztalceniaService.updateModulKsztalcenia($scope.modul);
                    $scope.isSaveAlertCollapsed = false;
                }
                else {
                    ModulksztalceniaService.addModulKsztalcenia($scope.modul);
                    console.log('usun modul ksztalcenia');
                    $scope.modul.program_studiow_id = 1;
                    $scope.isSaveAlertCollapsed = false;
                }
            }

		}

})();
