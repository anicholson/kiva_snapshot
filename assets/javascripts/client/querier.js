var querier = angular.module('querier', []);

querier.controller('KivaAPIController', function($scope, $http) {
  $scope.query   = '2';
  $scope.results = 'aha';

  $scope.doQuery = function() {
    $http.post('/api/query', { query: $scope.query }).success(function(data, status, headers, config) {
      console.log(data);
      $scope.results = JSON.stringify(data);
    });
    return true;
  }
});
