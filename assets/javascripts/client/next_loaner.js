kivaSnapshot.controller('NextLoanerController', function($scope) {
  var loanerIsMe = function() {
    return false;
  };

  $scope.loaner = {
    name: "Will Hore-Lacy",
    is_me: loanerIsMe()
  };
});
