(function(){
	angular
		.module('eatmates')
		.controller('ReservationCreateCtrl', ReservationCreateCtrl);

		ReservationCreateCtrl.$inject = ['$rootScope', '$state', 'Resident'];
		function ReservationCreateCtrl($rootScope, $state, Resident){
			var vm = this;
			vm.reservation = {};
			console.log('in reservation create ctrl');
			// Initialize reservation object on vm
			vm.reservation = {};

			vm.submit = function(){
				console.log('reservation is ', vm.reservation);
				Resident.save({reservation: vm.reservation, user_id: $rootScope.user.id})
					.$promise
					.then(function(response){
						console.log('response is', response);
						$state.go('home');
					})
			}
		};
})();