kivaSnapshot.controller('AmountLentController', function($scope, $http) {
  $http.get('/api/stats.json').success(function(data, status, headers, config) {
    if(data.loanCount) {
      $scope.loanCount = data.loanCount;
    } else {
      $scope.loanCount = 'N/A';
    }

    if(data.activeLoans) {
      $scope.activeLoans = data.activeLoans;
    } else {
      $scope.activeLoans = 'N/A';
    }

    if(data.amountLoaned) {
      $scope.amountLoaned = data.amountLoaned / 100;
    } else {
      $scope.amountLoaned = 'N/A';
    }

    if(data.amountRepaid) {
      $scope.amountRepaid = data.amountRepaid / 100;
    } else {
      $scope.amountRepaid = 'N/A';
    }

    if(data.updatedAt) {
      $scope.updatedAt = data.updatedAt;
    } else {
      $scope.updatedAt = 'N/A';
    }
  })
});
