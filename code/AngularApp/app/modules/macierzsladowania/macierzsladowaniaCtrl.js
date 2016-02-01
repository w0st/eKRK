'use strict';

(function() {

	/**
	* @ngdoc function
	* @name app.controller:macierzsladowaniaCtrl
	* @description
	* # macierzsladowaniaCtrl
	* Controller of the app
	*/
	angular
		.module('macierzsladowania')
		.controller('MacierzSladowaniaCtrl', MacierzSladowania);

		MacierzSladowania.$inject = ['MacierzSladowaniaService', '$scope'];

		/*
		* recommend
		* Using function declarations
		* and bindable members up top.
		*/

		function MacierzSladowania(MacierzSladowaniaService, $scope) {

		  $scope.list1 = {title: "abc"};
		  $scope.list2 = {};

          $scope.list5 = {};

			/*jshint validthis: true */
			var vm = this;
			$scope.ms= {};
            MacierzSladowaniaService.getObszaroweEfektyKsztalcenia().then(function(response) {
                vm.macierz = response;
            }, function(reason) {
                console.log("Nie udalo sie pobrac macierzy");
            });

            MacierzSladowaniaService.getKierunkoweEfektyKsztalcenia().then(function(response) {
                 $scope.ms = response;
                 $scope.list5 = response;
                 angular.forEach($scope.list5, function(value){
                    value['drag']= true;
                 });
                console.log("kierunkowe efekty ksztalcenia = ", response)
            }, function(reason) {
                console.log("Nie udalo sie pobrac kierunkowych efektow ksztalcenia");
            });

            MacierzSladowaniaService.set([
                    {
                        "kierunkowe_efekty_ksztalcenia":
                            [
                                {
                                    "id": 1
                                }
                            ],
                        "id": 2
                    }
            ]).then(function(response) {
                console.log("Udalo sie zaktualizowac macierz sladowania");
            }, function(reason) {
                console.log("Wystapil blad podczas proby aktualizacji macierzy sladowania");
            });

		}

})();
