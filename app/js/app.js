'use strict';
angular.module('geek', ['geek.controllers','ngRoute']).config(['$routeProvider', function($routeProvider) {
    $routeProvider.when('/geo', {templateUrl: 'partials/partial1.html', controller: 'MyCtrl1'});
    $routeProvider.when('/animate', {templateUrl: 'partials/animations.html', controller: 'MyCtrl2'});
    $routeProvider.otherwise({redirectTo: '/view1'});
  }]);