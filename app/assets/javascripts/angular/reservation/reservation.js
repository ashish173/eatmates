(function(){
	angular
		.module('eatmates')
		.config(config);

		config.$inject = ['$stateProvider'];
		function config($stateProvider){
			$stateProvider
				.state('reservation', {
					url: '/reservation',
					template: '<div ui-view></div>',
					abstract: true
				})
				.state('reservation.create', {
					url: '/create',
					templateUrl: 'assets/reservation/new.html',
					controller: 'ReservationCreateCtrl as vm'
				});
		};
})();