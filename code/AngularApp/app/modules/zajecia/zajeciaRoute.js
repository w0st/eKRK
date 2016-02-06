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
			})
            .state('kurs', {
            url:'/zajecia/kurs?przedmiot-ksztalcenia-id&kurs-id',
            templateUrl: 'app/modules/zajecia/kurs.html',
            controller: 'KursCtrl',
            controllerAs: 'vm'
        });
	}]);
