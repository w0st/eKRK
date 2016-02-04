'use strict';

(function() {

	/**
	* @ngdoc function
	* @name app.controller:przedmioty-ksztalceniaCtrl
	* @description
	* # przedmioty-ksztalceniaCtrl
	* Controller of the app
	*/
	angular
		.module('przedmioty-ksztalcenia')
		.controller('PrzedmiotKsztalceniaSzczegolyCtrl', PrzedmiotKsztalceniaSzczegoly);

        PrzedmiotKsztalceniaSzczegoly.$inject = ['PrzedmiotyKsztalceniaService', '$stateParams'];

		/*
		* recommend
		* Using function declarations
		* and bindable members up top.
		*/

		function PrzedmiotKsztalceniaSzczegoly(PrzedmiotyKsztalceniaService, $stateParams) {
			/*jshint validthis: true */
            this.przedmiot = {nazwaPrzedmiotu: undefined, opiekunPrzedmiotu: undefined };
            var vm = this;
            var id = $stateParams.id;

            if (id.match(/^\d+$/)) {
                PrzedmiotyKsztalceniaService.get({id: id}).$promise.then(function(response) {
                    vm.przedmiot = {
                        nazwaPrzedmiotu: response.nazwaPrzedmiotu,
                        opiekunPrzedmiotu: response.opiekunPrzedmiotu.email
                    };
                }, function(reason) {
                    console.log("fail get(1)");
                });

                // fake data, tylko dla sprawdzenia idei widoku
                vm.kursy = [
                    {
                        kod: 'KOD',
                        godzinyZZU: 'Cos',
                        godzinyCNPS: 'COS',
                        forma: 'Wyklad'
                    },
                    {
                        kod: 'KOD2',
                        godzinyZZU: 'Cos111',
                        godzinyCNPS: 'COS222',
                        forma: 'Laborka'
                    }
                ];
                vm.properties = _.keys(vm.kursy[0]);
            }
		}

})();
