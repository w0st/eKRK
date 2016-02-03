'use strict';

(function() {

	/**
	* @ngdoc function
	* @name app.controller:profilemodulowCtrl
	* @description
	* # profilemodulowCtrl
	* Controller of the app
	*/
	angular
		.module('profilemodulow')
		.controller('ProfilemodulowCtrl', Profilemodulow);

		Profilemodulow.$inject = ['$scope','ProfilemodulowService', '$location', '$anchorScroll'];



		/*
		* recommend
		* Using function declarations
		* and bindable members up top.
		*/

		function Profilemodulow($scope, ProfilemodulowService, $location, $anchorScroll) {
			/*jshint validthis: true */
            var vm = this;
            vm.selectedProfile = null;
            vm.profilToDelete = null;
            vm.profilToSave;
            var initialProfileData;

            // Pobranie danych dla modulu
            ProfilemodulowService.getProfileForPK(1).then(function (result) {
                console.log(result)
                vm.profile_modulow = result;
                initialProfileData = angular.copy(result);
            }, function (reason) {
                vm.error = reason;
            });


            //Ustawia profil do edycji
            this.selectEditProfile = function(profil){
                console.log(profil);
                vm.profilToSave = profil;
                vm.selectedProfile = angular.copy(profil);

                // scroll to edit form after select
                $location.hash('edit-form');
                $anchorScroll();
            }

            // Ustawia profil do usuniacia
            // Po akceptacji usuniecia profilu wywolywana jest funkcja: deleteSelectedProfile
            this.selectProfilToDelete = function(profil) {
                console.log("select profil to delete: ");
                console.log(profil);
                vm.profilToDelete = profil;
            };

            // Usowa wybrany profil
            this.deleteSelectedProfile = function() {
                ProfilemodulowService.deleteProfilModulu(vm.profilToDelete.id).then(function (res) {
                        console.log('delete profile');
                        console.log(vm.profilToDelete);
                        var index = vm.profile_modulow.indexOf(vm.profilToDelete);
                        if(index != -1) {
                            vm.profile_modulow.splice(index, 1);
                        }
                    },
                    function (err) {
                        console.log("THERE WAS AN ERROR");
                    });
            }


            // Anuluje niezapisane zmiany
            this.reset = function() {
                vm.profilToSave =  null;
                vm.selectedProfile = null;
                vm.profile_modulow = angular.copy(initialProfileData);
            }


            // Tworzy nowy profil lub edytuje wybrany
            this.submit = function() {
                if(vm.selectedProfile != null) {
                    ProfilemodulowService.updateProfilModulu(vm.profilToSave).then(function (res) {
                            console.log('Edited profile');
                        },
                        function (err) {
                            console.log("THERE WAS AN ERROR");
                        });
                }
                else {
                    vm.profilToSave.program_studiow_id = 1;
                    ProfilemodulowService.addProfilModulu(vm.profilToSave).then(function (res) {
                            console.log('Saved profile');
                            vm.profile_modulow.push(res.data);
                            initialProfileData = angular.copy(vm.profile_modulow);
                        },
                        function (err) {
                               console.log("THERE WAS AN ERROR");
                        });
                }
                console.log(vm.profilToSave);
            }

		}

})();
