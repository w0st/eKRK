'use strict';

(function () {

    angular
        .module('program-studiow')
        .controller('ProgramStudiowCtrl', ProgramStudiow);

    ProgramStudiow.$inject = ['ProgramStudiowService', '$scope'];

    function ProgramStudiow(ProgramStudiowService, $scope) {
        /*jshint validthis: true */
        var vm = this;
        ProgramStudiowService.getProgramStudiow(1).then(function(result) {
            vm.ps = result;
        }, function(reason) {
            vm.error = reason;
        });

        this.addZagadnienie= function (){
            var program_studiow_id=1;
            var zagadnienie = $scope.examItemDescription;
            return ProgramStudiowService.createZagadnienieEgzaminu(zagadnienie, program_studiow_id);
        };
    }






})();

