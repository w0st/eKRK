'use strict';

/**
 * @ngdoc function
 * @name app.route:macierzsladowaniaRoute
 * @description
 * # macierzsladowaniaRoute
 * Route of the app
 */

angular.module('macierzsladowania')
	.config(['$stateProvider', function ($stateProvider) {
		$stateProvider
			.state('macierzsladowania', {
				url:'/macierzsladowania',
				templateUrl: 'app/modules/macierzsladowania/macierzsladowania.html',
				controller: 'MacierzSladowaniaCtrl',
				controllerAs: 'vm'
			});
	}]);
