(function(){
  angular
    .module('eatmates', [
      'ui.router'
    ])

    .config(['$stateProvider', '$urlRouterProvider', '$locationProvider', 
      function($stateProvider, $urlRouterProvider, $locationProvider){
        $stateProvider
          .state('home', {
            url: '/home',
            template: '<div>Hi there</div>',
            controller: 'HomeCtrl'
          });

        $urlRouterProvider.otherwise('/');  
    }])

    .run(['$state', 
      function($state){
      console.log('in run block');
      $state.go('home');
    }]);
})();