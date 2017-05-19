var myApp = angular.module('myApp',[]);

myApp.controller('AgentsCtrl', ['$scope', '$http', function($scope, $http) {
  const specialties = {
  	'0': 'Spy',
		'1': 'Assassin',
		'2': 'Guard',
		'3': 'Explorer',
		'4': 'Fighter'
  }

  $http.get('http://localhost:3000/agents.json')
    .then(function(res){
       $scope.agents = res.data;
    });

    $scope.specialty = function(kind){ return specialties[kind]; };

    $scope.status = function(free){ return free ? 'Libre' : 'Ocupado' };

    $scope.contracted = function(id){ return id ? 'Contratado' : 'Desempleado' };

    $scope.show = function(id){ 
    	return "show.html"
    };
}]);

myApp.controller('OneAgentCtrl', ['$scope', '$http', function($scope, $http) {
	$http.get('http://localhost:3000/agents/1.json')
    .then(function(res){
       $scope.agent = res.data;
    });

    
}]);