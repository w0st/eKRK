angular.module('app').constant('CONFIG', {
    /**
     * CLIENT_ID przypisany do aplikacji angularowej przez /oauth/applications
     */
    CLIENT_ID: '4b37e2f61a501e5e18795e13e6ab6c247cfd030a5e7253583288cbc5fa59bb5f',
    ANGULAR_URL: 'http://localhost:8000',
    RAILS_URL: 'http://localhost:3000',
    API_URL: 'http://localhost:3000/api/v1/',
    OAUTH_URL: 'http://localhost:3000/oauth/',
    LOGOUT_URL: 'http://localhost:3000/users/sign_out'
});
