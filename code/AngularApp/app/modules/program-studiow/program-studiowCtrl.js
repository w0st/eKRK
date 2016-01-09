'use strict';

(function () {

    angular
        .module('program-studiow')
        .controller('ProgramStudiowCtrl', ProgramStudiow);

    ProgramStudiow.$inject = ['ProgramStudiowService'];

    function ProgramStudiow(ProgramStudiowService) {
        /*jshint validthis: true */
        var vm = this;
        ProgramStudiowService.getProgramStudiow(1).then(function(result) {
            vm.content = result;
        }, function(reason) {
            vm.error = reason;
        });
    }


})();
