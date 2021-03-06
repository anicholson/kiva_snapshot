var querier = angular.module('querier', ['hljs']);

querier.controller('KivaAPIController', function($scope, $http) {
  $scope.query   = '/v1/my/stats.json';
  $scope.results = JSON.stringify({
  "number_of_loans": 15,
      "amount_of_loans": 1150,
      "number_of_invites": 0,
      "number_of_gift_certificates": 0,
      "number_of_loans_by_invitees": 0,
      "amount_of_loans_by_invitees": 0,
      "amount_repaid": 428.67,
      "default_rate": 0,
      "num_defaulted": 0,
      "total_defaulted": 0,
      "num_refunded": 0,
      "total_refunded": 0,
      "num_inactive": 0,
      "total_inactive": 0,
      "num_ended": 3,
      "total_ended": 150,
      "num_fund_raising": 0,
      "total_fund_raising": 0,
      "num_raised": 0,
      "num_paying_back": 12,
      "total_paying_back": 1000,
      "currency_loss": -0.32,
      "currency_loss_rate": 0.03,
      "amount_outstanding": 721.01,
      "num_inactive_expired": 0,
      "total_inactive_expired": 0,
      "num_expired": 0,
      "total_expired": 0,
      "arrears_rate": 0.0184,
      "amount_in_arrears": 13.2676,
      "number_delinquent": 2,
      "amount_refunded": 0,
      "amount_donated": 0,
      "amount_outstanding_promo": 0
}, null, 2);

  $scope.doQuery = function() {
    $http.post('/api/query', { query: $scope.query }).success(function(data, status, headers, config) {
      console.log(data);
      $scope.results = JSON.stringify(data, null, 2);
    });
    return true;
  }
});
