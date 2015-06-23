(function(){
	angular
		.module('eatmates')
		.factory('Reservation', Reservation);

		Reservation.$inject = ['$resource'];
		function Reservation($resource){
			return $resource('/api/v1/reservations.json', {});
		}
})();