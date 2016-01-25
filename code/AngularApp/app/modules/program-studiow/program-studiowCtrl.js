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
            vm.ps = result;
        }, function(reason) {
            vm.error = reason;
        });

         this.bag = [
                  {label: 'Monacle', selected: false},
                  {label: 'Top Hat', selected: true},
                  {label: 'Mustachio', selected: false},
                  {label: 'Coffee', selected: false}
                ];
    }






})();

