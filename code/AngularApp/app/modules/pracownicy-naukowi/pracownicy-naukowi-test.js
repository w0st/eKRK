'use strict';

(function () {
	describe('pracownicy-naukowi test', function () {
		var controller = null, $scope = null;
	
		beforeEach(function () {
			module('app');
		});
		
		beforeEach(inject(function ($controller, $rootScope) {
			$scope = $rootScope.$new();
			controller = $controller('Pracownicy-naukowiCtrl', {
				$scope: $scope
			});
		}));
		
		it('Should controller must be defined', function () {
			expect(controller).toBeDefined();
		});

	});
})();
