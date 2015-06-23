(function(){
	angular
		.module('eatmates')
		.service('Home', Home)
		.factory('TestFactory', TestFactory)
		.service('TestService', TestService)
		.service('AnotherTestService', AnotherTestService);

		Home.$inject = ['$state'];
		function Home($state){
			// object to be persisted
			user = {};

			this.getName = function(){
				return user.name;
			},

			this.setName = function(name){
				user.name = name;
			}
		}

		TestFactory.$inject = ['$state'];
		function TestFactory($state) {
			
			var util = {};

			util = {
				splitName: function(name){
					return name.split(" ")[0];
				},
				setName: function(name){
					this.name = name;
				},
				getName: function(){
					return this.name;
				}
			};
			return util;
		}

		AnotherTestService.$inject = ['$state'];
		function AnotherTestService($state){
			var name = "";

			this.splitName = function(name){
				return name.split(" ")[0];
			}; 
			this.setName = function(newName){
				name = newName;
			};

			this.getName = function(){
				return name;
			}
		}

		// A service but a behaves like a factory
		TestService.$inject = ['$state'];
		function TestService($state){
			var util = {};

			util = {
				splitName: function(name){
					return name.split(" ")[0];
				},
				name: "dsfkj"
			};

			return util;
		}


})();