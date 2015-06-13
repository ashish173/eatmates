(function(){
	angular
		.module('eatmates')
		.controller('HomeCtrl', HomeCtrl);

		HomeCtrl.$inject = ['$state'];
		function HomeCtrl($state){
			console.log('In home controller');
			var vm = this;

			vm.reservations = ['Person 1 today', 'Person 2 tomorrow', 'Person 3 day after'];
		};
})();