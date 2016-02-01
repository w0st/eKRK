'use strict';

// TODO Dodać tłumaczenia dla tabeli
// TODO Konfiguracja Datatable

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

		ModulyKsztalcenia.$inject = ['$scope', 'ModulyKsztalceniaService'];

		/*
		* recommend
		* Using function declarations
		* and bindable members up top.
		*/

		function ModulyKsztalcenia($scope, ModulyKsztalceniaService) {
            /*jshint validthis: true */
            var vm = this;

            $scope.modulToDelete = null;
            $scope.selectedTab = 0;

            // Pobranie danych dla modulu
            ModulyKsztalceniaService.getProfileForPK(1).then(function (result) {
                vm.profile_modulow = result;

                $('.table').DataTable({
                    responsive: true
                });

            }, function (reason) {
                vm.error = reason;
            });


            // Ustawianie wybranej zakładki
            $scope.setTab = function (tabId) {
                $scope.selectedTab = tabId;
            };


            // Ustawia modul do usuniacia
            // Po akceptacji usuniecia modulu wywolywana jest funkcja: deleteSelectedModul
            $scope.selectModulToDelete = function(modul) {
                console.log("select modul to delete: ");
                console.log(modul);
                $scope.modulToDelete = modul;
            };


            // Usuwa wybrany wszczesnie modul
            $scope.deleteSelectedModul = function () {
                ModulyKsztalceniaService.deleteModulKsztalcenia($scope.modulToDelete.id);
                vm.profile_modulow.forEach(function(profile) {
                    console.log(profile);
                    var index =profile.moduly_ksztalcenia.indexOf($scope.modulToDelete);
                    if(index != -1) {
                        console.log('delete index: '+index);
                        profile.moduly_ksztalcenia.splice(index, 1);
                    }

                });
            };

        }
})();
