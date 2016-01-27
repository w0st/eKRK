'use strict';

(function () {

    angular
        .module('program-studiow')
        .controller('ProgramStudiowCtrl', ProgramStudiow);

    ProgramStudiow.$inject = ['ProgramStudiowService', '$scope'];

    function ProgramStudiow(ProgramStudiowService, $scope) {
        /*jshint validthis: true */
        var vm = this;
        $scope.ps= {};
        ProgramStudiowService.getProgramStudiow(1).then(function(result) {
            vm.ps = result;
            $scope.ps= result;
        }, function(reason) {
            vm.error = reason;
        });

        this.selectedZagadnienia = [];

        this.addZagadnienie = function (){
            var program_studiow_id=1;
            var zagadnienie = $scope.examItemDescription;
            return ProgramStudiowService.createZagadnienieEgzaminu(zagadnienie, program_studiow_id);
        };

        this.deleteZagadnienia = function(){
            this.selectedZagadnienia.forEach(function(zagadnienie){
                ProgramStudiowService.deleteZagadnienieEgzaminu(zagadnienie.id);
            });
        }

        this.updateProgramStudiow = function(){
            var program = $scope.ps;
            delete program.zagadnienia_egzaminu_dyplomowego;
            console.log(program);
            ProgramStudiowService.updateProgramStudiow(program);
        }
    }






})();

