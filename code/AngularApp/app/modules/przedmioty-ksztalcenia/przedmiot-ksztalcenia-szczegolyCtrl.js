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

        PrzedmiotKsztalceniaSzczegoly.$inject = ['PrzedmiotyKsztalceniaService', 'ZajeciaService', '$stateParams'];

		/*
		* recommend
		* Using function declarations
		* and bindable members up top.
		*/

		function PrzedmiotKsztalceniaSzczegoly(PrzedmiotyKsztalceniaService, ZajeciaService, $stateParams) {
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
                vm.properties = [
                    'kodZajec',
                    'godzinyZZU',
                    'godzinyCNPS',
                    'sposobZaliczenia',
                    'punktyECTS',
                    'punktyECTSP',
                    'punktyECTSBK',
                    'czyOgolnouczelniany',
                    'rodzaj',
                    'typ'
                ];

                ZajeciaService.getKursy(id).then(function(response) {
                    console.log("kursy = ", response);
                    vm.kursy = response;
                }, function(reason) {
                    console.log("Blad = ", reason);
                });

                ZajeciaService.getGrupaKursow(id).then(function(response) {
                    console.log("grupa kursow = ", response);
                }, function(reason) {
                   conole.log("blad = ", reason);
                });
            }

            vm.deleteZajecie = function(id) {
                console.log('usun zajecie = ', id);
                ZajeciaService.deleteZajecie(id).then(function(response) {
                    console.log('Usunieto zajecia');
                }, function (reason) {
                    console.log('Blad = ', reason);
                });
            }
		}

})();
