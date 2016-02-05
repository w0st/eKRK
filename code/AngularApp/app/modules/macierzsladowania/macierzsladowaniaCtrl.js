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

            $scope.listKierunkoweEfekty = [
            ];

			/*jshint validthis: true */
			var vm = this;
			$scope.kierunkoweEfekty= {};
			$scope.obszaroweEfekty= {};
			$scope.ms= {};


            MacierzSladowaniaService.getKierunkoweEfektyKsztalcenia().then(function(response) {
                 $scope.kierunkoweEfekty = response;
                 $scope.listKierunkoweEfekty = response;
                 angular.forEach($scope.listKierunkoweEfekty, function(value){
                   value['drag']= true;
                 });
                console.log("kierunkowe efekty ksztalcenia = ", response)
            }, function(reason) {
                console.log("Nie udalo sie pobrac kierunkowych efektow ksztalcenia");
            });

             MacierzSladowaniaService.getObszaroweEfektyKsztalcenia().then(function(response) {
                            vm.macierz = response;
                            $scope.obszaroweEfekty=response;
                            angular.forEach($scope.obszaroweEfekty, function(efektObszarowy){
                                angular.forEach(efektObszarowy.kierunkowe_efekty_ksztalcenia, function(efektKsztalcenia){
                                    var i = parseInt(efektKsztalcenia.id,10)-1;
                                    //console.log($scope.kierunkoweEfekty[i]);
                                    //efektKsztalcenia["kod"] = $scope.kierunkoweEfekty[i];
                                   // efektKsztalcenia["allInf"] = $scope.kierunkoweEfekty[i];
                                });
                            });

                        }, function(reason) {
                            console.log("Nie udalo sie pobrac macierzy");
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
