angular.module('app').constant('CONFIG', {
    /**
     * CLIENT_ID przypisany do aplikacji angularowej przez /oauth/applications
     */
    CLIENT_ID: 'bf01a2c8e7d49f42518f57899f9180a85eb2f9a904f3d8510182aab2899059ce',
    ANGULAR_URL: 'http://localhost:5000',
    RAILS_URL: 'http://localhost:3000',
    API_URL: 'http://localhost:3000/api/v1/',
    OAUTH_URL: 'http://localhost:3000/oauth/',
    LOGOUT_URL: 'http://localhost:3000/users/sign_out'
});
