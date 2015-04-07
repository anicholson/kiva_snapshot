kivaSnapshot.controller('AvailableBalanceController', function($scope, $http) {
  $http.get('/api/user_balance.json').success( function(data, status, headers, config) {
    if(data.updatedAt) {
      $scope.updatedAt = data.updatedAt;
    } else {
      $scope.updatedAt = 'N/A';
    }

    if(data.amount) {
      $scope.balance   = data.amount;
    } else {
      $scope.balance = '';
    }
  });
});
