'use strict';

/**
 * @ngdoc function
 * @name app.route:zajeciaRoute
 * @description
 * # zajeciaRoute
 * Route of the app
 */

angular.module('zajecia')
	.config(['$stateProvider', function ($stateProvider) {
		$stateProvider
			.state('zajecia', {
				url:'/zajecia',
				templateUrl: 'app/modules/zajecia/zajecia.html',
				controller: 'ZajeciaCtrl',
				controllerAs: 'vm'
			});
	}]);
