kivaSnapshot.controller('NextLoanerController', function($scope) {
  var loanerIsMe = function() {
    if((Math.ceil(Math.random() * 100) % 2) == 0){
      return 'me';
    } else {
      return '';
    }
  };

  $scope.loaner = {
    name: "James Griffiths",
    is_me: loanerIsMe()
  };
});
