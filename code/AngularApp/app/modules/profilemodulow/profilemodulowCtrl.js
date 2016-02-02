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
            $scope.selectedProfile = null;
            $scope.profilToDelete = null;
			var vm = this;
            var initialProfileData;

            // Pobranie danych dla modulu
            ProfilemodulowService.getProfileForPK(1).then(function (result) {
                console.log(result)
                vm.profile_modulow = result;
                initialProfileData = angular.copy(result);
            }, function (reason) {
                vm.error = reason;
            });

            $scope.selectEditProfile = function(profil){
                console.log(profil);
                $scope.profilToSave = profil;
                $scope.selectedProfile = angular.copy(profil);

                // scroll to edit form after select
                $location.hash('edit-form');
                $anchorScroll();
            }

            // Ustawia profilu do usuniacia
            // Po akceptacji usuniecia profilu wywolywana jest funkcja: deleteSelectedProfile
            $scope.selectProfilToDelete = function(profil) {
                console.log("select profil to delete: ");
                console.log(profil);
                $scope.profilToDelete = profil;
            };

            // Usowa wybrany profil
            $scope.deleteSelectedProfile = function() {
                ProfilemodulowService.deleteProfilModulu($scope.profilToDelete.id).then(function (res) {
                        console.log('delete profile');
                        console.log($scope.profilToDelete);
                        var index = vm.profile_modulow.indexOf($scope.profilToDelete);
                        if(index != -1) {
                            vm.profile_modulow.splice(index, 1);
                        }
                    },
                    function (err) {
                        console.log("THERE WAS AN ERROR");
                    });
            }

            $scope.reset = function() {
                $scope.profilToSave =  null;
                $scope.selectedProfile = null;
                vm.profile_modulow = angular.copy(initialProfileData);
            }

            $scope.submit = function() {

                if($scope.selectedProfile != null) {
                    ProfilemodulowService.updateProfilModulu($scope.profilToSave);
                    console.log('Edited profile:');
                }
                else {
                    $scope.profilToSave.program_studiow_id = 1;
                    ProfilemodulowService.addProfilModulu($scope.profilToSave).then(function (res) {
                            console.log('Saved profile');
                            vm.profile_modulow.push(res.data);
                        },
                        function (err) {
                               console.log("THERE WAS AN ERROR");
                        });

                }
                console.log( $scope.profilToSave);

                initialProfileData = angular.copy(vm.profile_modulow);
            }

		}

})();
