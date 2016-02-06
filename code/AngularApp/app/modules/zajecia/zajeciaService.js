'use strict';

(function () {

    /**
     * @ngdoc function
     * @name app.service:zajeciaService
     * @description
     * # zajeciaService
     * Service of the app
     */
    angular
        .module('zajecia')
        .factory('ZajeciaService', Zajecia);
    // Inject your dependencies as .$inject = ['$http', 'someSevide'];
    // function Name ($http, someSevide) {...}

    Zajecia.$inject = ['$http', 'CONFIG', '$resource'];

    function Zajecia($http, CONFIG, $resource) {
        return {
            getKursy: function (id) {
                return $resource(CONFIG.API_URL + "przedmioty_ksztalcenia/:id/kursy",
                    {id: '@id'},
                    {'get': {method: 'GET', isArray: true}}
                ).get({id: id}).$promise;
            },
            getGrupaKursow: function (id) {
                return $resource(CONFIG.API_URL + "przedmioty_ksztalcenia/:id/grupa_kursow",
                    {id: '@id'},
                    {'get': {method: 'GET'}}
                ).get({id: id}).$promise;
            },
            deleteZajecie: function (id) {
                return $resource(CONFIG.API_URL + 'zajecia/:id',
                    {id: '@id'},
                    {'delete': {method: 'DELETE'}}
                ).delete({id: id}).$promise;
            },
            getKurs: function (id) {
                return $resource(CONFIG.API_URL + "zajecia/kurs/:id").get({id: id}).$promise;
            },
            updateKurs: function (kurs) {
                return $http.put(CONFIG.API_URL + "/zajecia/kurs", kurs);
            },
            addKurs: function (kurs) {
                return $http.post(CONFIG.API_URL + "/zajecia/kurs", kurs);
            }
        };

    }

})();
