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

    Kurs.$inject = ['PrzedmiotyKsztalceniaService', 'ZajeciaService', '$state', '$stateParams', '$timeout'];

    /*
     * recommend
     * Using function declarations
     * and bindable members up top.
     */

    function Kurs(PrzedmiotyKsztalceniaService, ZajeciaService, $state, $stateParams, $timeout) {
        /*jshint validthis: true */
        var vm = this;
        var przedmiotKsztalceniaId = $stateParams['przedmiot-ksztalcenia-id'];
        var kursId = $stateParams['kurs-id'];
        vm.isUpdateAlertVisible = false
        vm.przedmiotKsztalceniaId = przedmiotKsztalceniaId

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

        vm.formyKursow = ZajeciaService.getFormyKursow();

        vm.sposobyZaliczenia = ZajeciaService.getSposobyZaliczenia();

        vm.rodzaje = ZajeciaService.getRodzajeKursu();

        vm.typy = ZajeciaService.getTypyKursu();

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

        vm.reset = function() {
            $state.reload();
        }

        vm.updateKurs = function() {
            ZajeciaService.updateKurs(vm.kurs).then(
                function (result) {
                    console.log(result);
                    vm.dispaySuccessAlert()
                }, function (reason) {
                    console.log(reason);
                });
        }

        vm.addKurs = function() {
            vm.kurs.przedmiot_ksztalcenia_id = przedmiotKsztalceniaId;
            ZajeciaService.addKurs(vm.kurs).then(
                function (result) {
                    console.log(result)
                    vm.dispaySuccessAlert()
                }, function (reason) {
                    console.log(reason);
                });
        }

        vm.dispaySuccessAlert = function() {
            vm.isUpdateAlertVisible = true
            $timeout(function() {
                vm.isUpdateAlertVisible = false
            }, 3000)
        }

    }

})();
