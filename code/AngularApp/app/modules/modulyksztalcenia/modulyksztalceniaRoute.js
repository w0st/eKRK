'use strict';

/**
 * @ngdoc function
 * @name app.route:modulyksztalceniaRoute
 * @description
 * # modulyksztalceniaRoute
 * Route of the app
 */

angular.module('modulyksztalcenia')
	.config(['$stateProvider', function ($stateProvider) {
		$stateProvider
			.state('modulyksztalcenia', {
				url:'/modulyksztalcenia',
				templateUrl: 'app/modules/modulyksztalcenia/modulyksztalcenia.html',
				controller: 'ModulyKsztalceniaCtrl',
				controllerAs: 'vm'
			});
	}]);
