(function(){
  angular
    .module('eatmates', [
      'ui.router',
      'ngAnimate',
      'ngResource',
      'ngMaterial'
    ])

    .config(['$stateProvider', '$urlRouterProvider', '$locationProvider', 
      function($stateProvider, $urlRouterProvider, $locationProvider){
        $stateProvider
          .state('home', {
            url: '/home',
            templateUrl: '/assets/home/index.html',
            controller: 'HomeCtrl as vm'
          });

        $urlRouterProvider.otherwise('/');  
    }])

    .run(['$state', 
      function($state){
      console.log('in run block');
      $state.go('home');
    }]);
})();