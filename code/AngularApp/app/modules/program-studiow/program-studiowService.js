'use strict';

(function () {

    angular
        .module('program-studiow')
        .factory('ProgramStudiowService', ProgramStudiow);
    // Inject your dependencies as .$inject = ['$http', 'someSevide'];
    // function Name ($http, someSevide) {...}

    ProgramStudiow.$inject = ['$resource', 'CONFIG'];

    function ProgramStudiow($resource, CONFIG) {
        return {
            getProgramStudiow: function(id) {
                return $resource(CONFIG.API_URL + "programy_studiow/:id").get({id: id}).$promise;
            }
        }
    }

})();
