'use strict';

(function () {

    /**
     * @ngdoc function
     * @name app.controller:program-ksztalceniaCtrl
     * @description
     * # program-ksztalceniaCtrl
     * Controller of the app
     */
    angular
        .module('program-ksztalcenia')
        .controller('ProgramKsztalceniaCtrl', ProgramKsztalcenia);

    ProgramKsztalcenia.$inject = ['ProgramKsztalceniaService'];

    /*
     * recommend
     * Using function declarations
     * and bindable members up top.
     */

    function ProgramKsztalcenia(ProgramKsztalceniaService) {
        /*jshint validthis: true */
        var vm = this;
        ProgramKsztalceniaService.get(1).then(function(result) {
            vm.content = result;
        }, function(reason) {
            vm.error = reason;
        });

    }

})();
