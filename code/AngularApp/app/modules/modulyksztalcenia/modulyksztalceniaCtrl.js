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

		ModulyKsztalcenia.$inject = ['$scope', 'ModulyKsztalceniaService'];

		/*
		* recommend
		* Using function declarations
		* and bindable members up top.
		*/

		function ModulyKsztalcenia($scope, ModulyKsztalceniaService) {
			/*jshint validthis: true */
			var vm = this;
            $scope.selectedTab = 0;


            ModulyKsztalceniaService.getProfileForPK(1).then(function(result) {
                    vm.profile_modulow = result;

                    $('.table').DataTable({
                        responsive: true
                    });

                }, function(reason) {
                    vm.error = reason;
                });


            // Ustawianie wybranej zakładki
            $scope.setTab = function (tabId) {
                    $scope.selectedTab = tabId;
                };

		}



})();
