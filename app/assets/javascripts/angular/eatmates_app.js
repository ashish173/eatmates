(fuction(){
	angular
		.module('eatmates', [
			'ui-router'
		])

		.config('$stateProvider', function($stateProvider){

		})

		.run('$state', function($state){
			$state.go('home');
		});
})();