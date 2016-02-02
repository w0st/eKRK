'use strict';

/**
 * @ngdoc function
 * @name app.route:profilemodulowRoute
 * @description
 * # profilemodulowRoute
 * Route of the app
 */

angular.module('profilemodulow')
	.config(['$stateProvider', function ($stateProvider) {
		$stateProvider
			.state('profilemodulow', {
				url:'/modulyksztalcenia/profilemodulow',
				templateUrl: 'app/modules/profilemodulow/profilemodulow.html',
				controller: 'ProfilemodulowCtrl',
				controllerAs: 'vm'
			});
	}]);
