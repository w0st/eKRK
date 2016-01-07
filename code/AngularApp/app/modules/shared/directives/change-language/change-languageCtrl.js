'use strict';

(function() {

	/**
	* @ngdoc function
	* @name app.controller:changelanguageCtrl
	* @description
	* # changelanguageCtrl
	* Controller of the app
	*/
angular
		.module('app')
		.controller('ChangeLanguageCtrl', ChangeLanguage );

		ChangeLanguage.$inject = ['$translate'];

		/*
		* recommend
		* Using function declarations
		* and bindable members up top.
		*/

		function ChangeLanguage($translate) {
			/*jshint validthis: true */
			var vm = this;

            vm.getLanguage = function() {
                return $translate.use();
            };

            vm.setLanguage = function(language) {
                $translate.use(language);
            };

		}

})();
