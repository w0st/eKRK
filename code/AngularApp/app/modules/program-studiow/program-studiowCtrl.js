'use strict';

(function () {

    angular
        .module('program-studiow')
        .controller('ProgramStudiowCtrl', ProgramStudiow);

    ProgramStudiow.$inject = ['ProgramStudiowService', '$scope'];

    function ProgramStudiow(ProgramStudiowService, $scope) {

        $scope.isSaveAlertCollapsed=true;

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
            var noweZagadnienie = ProgramStudiowService.createZagadnienieEgzaminu(zagadnienie, program_studiow_id);
            $scope.ps.zagadnienia_egzaminu_dyplomowego.push({zagadnienie: zagadnienie});
        };

        this.deleteZagadnienia = function(){
            this.selectedZagadnienia.forEach(function(zagadnienie){
                ProgramStudiowService.deleteZagadnienieEgzaminu(zagadnienie.id);
                var i = $scope.ps.zagadnienia_egzaminu_dyplomowego.indexOf(zagadnienie);
                if(i != -1) {
                	$scope.ps.zagadnienia_egzaminu_dyplomowego.splice(i, 1);
                }
            });
        }

        this.updateProgramStudiow = function(){
            var program = jQuery.extend(true, {}, $scope.ps);
            delete program.zagadnienia_egzaminu_dyplomowego;
            ProgramStudiowService.updateProgramStudiow(program);
            $scope.isSaveAlertCollapsed=false;
        }
    }






})();

