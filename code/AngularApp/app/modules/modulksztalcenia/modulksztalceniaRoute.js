'use strict';

/**
 * @ngdoc function
 * @name app.route:modulksztalceniaRoute
 * @description
 * # modulksztalceniaRoute
 * Route of the app
 */

angular.module('modulksztalcenia')
	.config(['$stateProvider', function ($stateProvider) {
		$stateProvider
			.state('modulksztalcenia', {
				url:'/modulyksztalcenia/modulksztalcenia',
				templateUrl: 'app/modules/modulksztalcenia/modulksztalcenia.html',
				controller: 'ModulksztalceniaCtrl',
				controllerAs: 'vm'
			});
	}]);
