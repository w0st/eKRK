angular.module('app').constant('CONFIG', {
    /**
     * CLIENT_ID przypisany do aplikacji angularowej przez /oauth/applications
     */
    CLIENT_ID: '89594a1482351ab0845d6cacecd1d80f8b9b11fc23af21032f99224e3ad6b3a2',
    ANGULAR_URL: 'http://localhost:8000',
    RAILS_URL: 'http://localhost:3000',
    API_URL: 'http://localhost:3000/api/v1/',
    OAUTH_URL: 'http://localhost:3000/oauth/',
    LOGOUT_URL: 'http://localhost:3000/users/sign_out'
});
