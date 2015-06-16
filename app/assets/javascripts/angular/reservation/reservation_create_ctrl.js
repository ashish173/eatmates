(function(){
	angular
		.module('eatmates')
		.controller('ReservationCreateCtrl', ReservationCreateCtrl);

		ReservationCreateCtrl.$inject = ['$state'];
		function ReservationCreateCtrl($state){
			var vm = this;
			console.log('in reservation create ctrl');
		};
})();