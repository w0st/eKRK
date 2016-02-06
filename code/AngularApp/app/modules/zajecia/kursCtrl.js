'use strict';

(function () {

    /**
     * @ngdoc function
     * @name app.controller:kursCtrl
     * @description
     * # kursCtrl
     * Controller of the app
     */
    angular
        .module('zajecia')
        .controller('KursCtrl', Kurs);

    Kurs.$inject = ['PrzedmiotyKsztalceniaService', 'ZajeciaService', '$state', '$stateParams'];

    /*
     * recommend
     * Using function declarations
     * and bindable members up top.
     */

    function Kurs(PrzedmiotyKsztalceniaService, ZajeciaService, $state, $stateParams) {
        /*jshint validthis: true */
        var vm = this;
        var przedmiotKsztalceniaId = $stateParams['przedmiot-ksztalcenia-id'];
        var kursId = $stateParams['kurs-id'];

        console.log(przedmiotKsztalceniaId);

        if (przedmiotKsztalceniaId === undefined) {
            $state.go("home");
        }

        vm.isEditMode = function () {
            return kursId != undefined;
        }

        PrzedmiotyKsztalceniaService.get({id: przedmiotKsztalceniaId}).$promise.then(function(response) {
            vm.przedmiot = response;
        }, function(reason) {
            console.log(reason);
        });

        if (vm.isEditMode()) {
            vm.kurs = ZajeciaService.getKurs(kursId).then(
                function (result) {
                    vm.kurs = result;
                    console.log(result);
                }, function (reason) {
                    vm.error = reason;
                });
        }

        console.log('KursId: ' + kursId + ' IsEditMode:' + (vm.isEditMode() == true));

        vm.formyKursow = [
            {value: 'Wyklad', label: "formy_kursow_wyklad"},
            {value: 'Cwiczenia', label: "formy_kursow_cwiczenia"},
            {value: 'Laboratorium', label: "formy_kursow_laboratorium"},
            {value: 'Seminarium', label: "formy_kursow_seminarium"},
            {value: 'Projekt', label: "formy_kursow_projekt"},
            {value: 'Praktyka', label: "formy_kursow_praktyka"},
            {value: 'PracaDyplomowa', label: "formy_kursow_praca_dyplomowa"}
        ];

        vm.sposobyZaliczenia = [
            {value: 'Zaliczenie', label: "sposoby_zaliczenia_zaliczenie"},
            {value: 'Egzamin', label: "sposoby_zaliczenia_egzamin"}
        ];

        vm.rodzaje = [
            {value: 'KsztalceniaOgolnego', label: "rodzaje_kursow_ksztalcenia_ogolnego"},
            {value: 'Podstawowy', label: "rodzaje_kursow_podstawowy"},
            {value: 'Kierunkowy', label: "rodzaje_kursow_kierunkowy"},
            {value: 'Specjalnosciowy', label: "rodzaje_kursow_specjalnosciowy"}
        ];

        vm.typy = [
            {value: 'Wybieralny', label: "typy_kursow_wybieralny"},
            {value: 'Obowiazkowy', label: "typy_kursow_obowiazkowy"}
        ];

        vm.save = function () {
            if(vm.isEditMode()) {
                console.log('Update Kurs');
                vm.updateKurs();
            }
            else{
                console.log('Add new Kurs');
                vm.addKurs();
            }
            console.log(vm.kurs);
        }

        vm.updateKurs = function() {
            ZajeciaService.updateKurs(vm.kurs).then(
                function (result) {
                    console.log(result);
                }, function (reason) {
                    console.log(reason);
                });
        }

        vm.addKurs = function() {
            vm.kurs.przedmiot_ksztalcenia_id = przedmiotKsztalceniaId;
            ZajeciaService.addKurs(vm.kurs).then(
                function (result) {
                    console.log(result);
                }, function (reason) {
                    console.log(reason);
                });
        }

    }

})();
