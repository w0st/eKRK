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

        PrzedmiotKsztalceniaSzczegoly.$inject = ['PrzedmiotyKsztalceniaService', 'ZajeciaService', '$stateParams', '$state'];

		/*
		* recommend
		* Using function declarations
		* and bindable members up top.
		*/

		function PrzedmiotKsztalceniaSzczegoly(PrzedmiotyKsztalceniaService, ZajeciaService, $stateParams, $state) {
			/*jshint validthis: true */
            this.przedmiot = {nazwaPrzedmiotu: undefined, opiekunPrzedmiotu: undefined };
            var vm = this;
            var id = $stateParams.id;
            vm.id = id;

            vm.load = function() {
                if (id.match(/^\d+$/)) {
                    PrzedmiotyKsztalceniaService.get({id: id}).$promise.then(function(response) {
                        vm.przedmiot = {
                            id: response.id,
                            nazwaPrzedmiotu: response.nazwaPrzedmiotu,
                            opiekunPrzedmiotu: response.opiekunPrzedmiotu.email
                        };
                    }, function(reason) {
                        console.log("fail get(1)");
                    });

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
                        vm.grupaKursow = response;
                    }, function(reason) {
                        console.log("blad = ", reason);
                        vm.grupaKursow = undefined;
                    });
                }
            };


            vm.selectKurs = function(kurs) {
                vm.selectedKurs = kurs;
            };

            vm.deleteKurs = function(id) {
                // TODO Modal
                console.log('usun zajecie = ', id);
                ZajeciaService.deleteZajecie(id).then(function(response) {
                    console.log('Usunieto zajecia');
                    vm.load();
                }, function (reason) {
                    console.log('Blad = ', reason);
                });
            };

            vm.deleteGrupa = function(id) {
                vm.deleteKurs(id);
            };

            this.selectPrzedmiot = function(przedmiot) {
                vm.selectedPrzedmiot = przedmiot;
            };

            this.deletePrzedmiot = function(id) {
                PrzedmiotyKsztalceniaService.delete({id: id}).$promise.then(function (response) {
                    console.log('usunieto');
                    $state.go('przedmioty-ksztalcenia');
                }, function (reason) {
                    console.log('problem = ', reason);
                });
            };

            vm.load();

        }

})();
