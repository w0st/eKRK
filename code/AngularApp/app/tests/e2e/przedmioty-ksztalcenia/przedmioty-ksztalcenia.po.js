var PrzedmiotyKsztalcenia = function() {

    this.get = function() {
        browser.get('http://127.0.0.1:8000/przedmioty-ksztalcenia');
    };

    this.nazwa1 = "Matematyka dyskretna";
    this.komunikat1 = "Please insert unique name for the subject"

};

module.exports = PrzedmiotyKsztalcenia;
