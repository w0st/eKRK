'use strict';

(function() {

	/**
	* @ngdoc function
	* @name app.controller:logoutCtrl
	* @description
	* # logoutCtrl
	* Controller of the app
	*/
angular
		.module('app')
		.controller('LogoutCtrl', Logout );

		Logout.$inject = ['LogoutService', 'CONFIG'];

		/*
		* recommend
		* Using function declarations
		* and bindable members up top.
		*/

		function Logout(LogoutService, CONFIG) {
			/*jshint validthis: true */
			var vm = this;

            vm.username = undefined;
            vm.CONFIG = CONFIG;

            vm.logout = function() {
                LogoutService.logOut();
                vm.username = undefined;
            };

            LogoutService.getUser().then(function(response) {
                if (_.has(response, 'email')) {
                    vm.username = response.email;
                }
                console.log('response = ', response);
            }, function(reason) {
                console.log('problem = ', reason);
            });


		}

})();
