'use strict';

/**
 * @ngdoc function
 * @name app.route:modulksztalceniaRoute
 * @description
 * # modulksztalceniaRoute
 * Route of the app
 */

angular.module('modul-ksztalcenia')
	.config(['$stateProvider', function ($stateProvider) {
		$stateProvider
			.state('modul-ksztalcenia', {
				url:'/moduly-ksztalcenia/modul-ksztalcenia',
				templateUrl: 'app/modules/modul-ksztalcenia/modul-ksztalcenia.html',
				controller: 'ModulKsztalceniaCtrl',
				controllerAs: 'vm'
			});
	}]);
