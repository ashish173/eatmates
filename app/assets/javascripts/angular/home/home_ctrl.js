(function(){
	angular
		.module('eatmates')
		.controller('HomeCtrl', HomeCtrl);

		HomeCtrl.$inject = ['$state'];
		function HomeCtrl($state){
			console.log('In home controller');
			var vm = this;
		};
})();