'use strict';

/**
 * @ngdoc function
 * @name app.route:authorisationRoute
 * @description
 * # authorisationRoute
 * Route of the app
 */

angular.module('authorisation')
	.config(['$stateProvider', function ($stateProvider) {
		$stateProvider
			.state('authorisation', {
				url:'/access_token=:response',
                template: 'Poprawnie zalogowany. Otrzyman token: {{vm.token}}',
				controller: 'AuthorisationCtrl',
				controllerAs: 'vm'
			});
	}]);
