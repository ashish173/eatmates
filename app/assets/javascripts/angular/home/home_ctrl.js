(function(){
	angular
		.module('eatmates')
		.controller('HomeCtrl', HomeCtrl);

		HomeCtrl.$inject = ['$rootScope', '$state', '$http', 'Reservation'];
		function HomeCtrl($rootScope, $state, $http, Reservation){
			console.log('In home controller');
			var vm = this;

			Reservation.get({page: 1})
				.$promise
				.then(function(response){
					console.log(response);
					vm.reservations = response.reservations;
				})

			vm.reservations = ['Person 1 today', 'Person 2 tomorrow', 'Person 3 day after'];
			$http.get('/welcome/current_user.json')
				.then(function(response){
					// TODO change user to User service to persist user object
					window.t = $rootScope.user = response.data.current_user;
				})
				.catch(function(error){
					console.log(error);
				})
		};
})();