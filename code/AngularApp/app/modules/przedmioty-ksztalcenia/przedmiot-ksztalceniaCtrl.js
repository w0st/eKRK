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
		.controller('PrzedmiotKsztalceniaCtrl', PrzedmiotyKsztalcenia);

        PrzedmiotyKsztalcenia.$inject = ['PrzedmiotyKsztalceniaService', 'PracownicyNaukowiService', '$state', '$stateParams'];

		/*
		* recommend
		* Using function declarations
		* and bindable members up top.
		*/

		function PrzedmiotyKsztalcenia(PrzedmiotyKsztalceniaService, PracownicyNaukowiService, $state, $stateParams) {
			/*jshint validthis: true */
            this.przedmiot = {nazwaPrzedmiotu: undefined, pracownik_naukowy_id: undefined };
            var vm = this;
            var id = $stateParams.id;


            if (id.match(/^\d+$/)) {
                console.log("parametr = ", id);

                PrzedmiotyKsztalceniaService.get({id: id}).$promise.then(function(response) {
                   console.log("Respnse = ", response);
                    vm.przedmiot = {
                        nazwaPrzedmiotu: response.nazwaPrzedmiotu,
                        pracownik_naukowy_id: response.pracownik_naukowy_id
                    };
                }, function(reason) {
                    console.log("fail get(1)");
                });
            }


            PracownicyNaukowiService.get().$promise.then(function (response) {
                vm.pracownicyNaukowi = response;
            }, function(reason) {
                console.log("Wystapil blad z pobraniem danych");
            });

            this.save = function() {
                if (id.match(/^\d+$/)) {
                    console.log('update');
                    vm.update();
                } else {
                    console.log('add');
                    vm.add();
                }
            };

            this.update = function() {
                console.log("przedmiot update = ", this.przedmiot);
                if (_.isEmpty(this.przedmiot.nazwaPrzedmiotu)) {
                    console.log("Proszę podaj nazwę przedmiotu");
                } else if (_.isEmpty(this.przedmiot.pracownik_naukowy_id)) {
                    console.log("Proszę wybierz pracownika");
                } else {
                    // sprawdz pola
                    // wyslij request
                    PrzedmiotyKsztalceniaService.update( {
                        id: id,
                        nazwaPrzedmiotu: this.przedmiot.nazwaPrzedmiotu,
                        program_ksztalcenia_id: 1,
                        pracownik_naukowy_id: parseInt(this.przedmiot.pracownik_naukowy_id)
                    }).$promise.then(function(response) {
                        console.log("SUKCES");
                    }, function(reason) {
                        console.log("PORAŻKA");
                    });
                    $state.go('przedmioty-ksztalcenia');
                }
            };

            this.add = function() {
                // sprobuj zapisac to co jest;
                console.log("przedmiot = ", this.przedmiot);
                if (_.isEmpty(this.przedmiot.nazwaPrzedmiotu)) {
                    console.log("Proszę podaj nazwę przedmiotu");
                } else if (_.isEmpty(this.przedmiot.pracownik_naukowy_id)) {
                    console.log("Proszę wybierz pracownika");
                } else {
                    // sprawdz pola
                    // wyslij request
                    PrzedmiotyKsztalceniaService.add( {
                     nazwaPrzedmiotu: this.przedmiot.nazwaPrzedmiotu,
                     program_ksztalcenia_id: 1,
                     pracownik_naukowy_id: this.przedmiot.pracownik_naukowy_id
                     }).$promise.then(function(response) {
                        console.log("SUKCES");
                     }, function(reason) {
                        console.log("PORAŻKA");
                     });
                    $state.go('przedmioty-ksztalcenia');
                }
            };



            // mockup
            /*this.pracownicyNaukowi = [
                {
                    id: 1,
                    email: "janusz.martan@pwr.wroc.pl"
                },
                {
                    id: 2,
                    email: "lech.madeyski@pwr.wroc.pl"
                }
            ];*/
            /*PrzedmiotyKsztalceniaService.add( {
                nazwaPrzedmiotu: "Angielski B2",
                program_ksztalcenia_id: 1,
                pracownik_naukowy_id: 1
            }).$promise.then(function(response) {

            }, function(reason) {

            });

            PrzedmiotyKsztalceniaService.delete({
                id: 4
            }).$promise.then(function (response) {
                console.log('usunieto');
            }, function (reason) {
                console.log('problem = ', reason);
            });*/
		}

})();