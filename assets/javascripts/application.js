var kivaSnapshot = angular.module('kivaSnapshot', ['highcharts-ng', 'ngResource']);

kivaSnapshot.controller('PublicLoansController', function($scope) {
  $scope.loans = [
      {
        "id": 848070,
        name: "Aigul",
        "description": {
          "languages": [
            "ru",
            "en"
          ]
        },
        "status": "fundraising",
        "funded_amount": 0,
        "basket_amount": 0,
        "image": {
          "id": 1825831,
          "template_id": 1
        },
        "activity": "Farming",
        "sector": "Agriculture",
        "use": "to buy fertilizers to cultivate her land and to buy a cow",
        "location": {
          "country_code": "KG",
          "country": "Kyrgyzstan",
          "town": "Kopuro-Bazar village, Talas region",
          "geo": {
            "level": "country",
            "pairs": "41 75",
            "type": "point"
          }
        },
        "partner_id": 171,
        "posted_date": "2015-03-07T04:20:02Z",
        "planned_expiration_date": "2015-04-06T04:20:02Z",
        "loan_amount": 1650,
        "borrower_count": 1,
        "lender_count": 0,
        "bonus_credit_eligibility": true,
        "tags": [
          {
            "name": "volunteer_like"
          }
        ]
      },
      {
        "id": 848068,
        "name": "Baktygul",
        "description": {
          "languages": [
            "ru",
            "en"
          ]
        },
        "status": "fundraising",
        "funded_amount": 50,
        "basket_amount": 0,
        "image": {
          "id": 1825824,
          "template_id": 1
        },
        "activity": "Livestock",
        "sector": "Agriculture",
        "use": "to increase her head of livestock",
        "location": {
          "country_code": "KG",
          "country": "Kyrgyzstan",
          "town": "Acha-Kaindy village",
          "geo": {
            "level": "country",
            "pairs": "41 75",
            "type": "point"
          }
        },
        "partner_id": 171,
        "posted_date": "2015-03-07T04:00:01Z",
        "planned_expiration_date": "2015-04-06T04:00:01Z",
        "loan_amount": 2475,
        "borrower_count": 1,
        "lender_count": 1,
        "bonus_credit_eligibility": true,
        "tags": [
          {
            "name": "#WomanOwnedBiz"
          },
          {
            "name": "#Parent"
          }
        ]
      }];
});


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

kivaSnapshot.controller('MoneyAvailableController', function($scope) {

  $scope.money_available_config = {
      chart: {
        type: 'spline'
      },
      title: {
        text: 'Money Available to Loan'
      },
      yAxis: {
        title: {
          text: '$(USD)'
        },
        labels: {
          formatter: function () {
            return this.value;
          }
        },
        min: 0
      },
      tooltip: {
        crosshairs: true,
        shared: true
      },
      plotOptions: {
        spline: {
          marker: {
            radius: 1,
            lineColor: '#666666',
            lineWidth: 1
          }
        }
      },
      series: [{
        name: 'Balance',
        marker: {
          enabled: false
        },
        data: [32.5434268,
          24.32171078,
          39.8547529,
          43.52507285,
          0,
          15.4612509,
          31.86834589,
          47.32060343,
          29.06999726,
          38.84729046,
          49.4905404,
          51.43220566,
          71.69858792,
          37.41419083,
          46.03981721,
          50.10897498,
          41.01982817,
          31.29012195,
          10.11505303,
          17.05557802,
          10.36251713,
          32.654897,
          37.53505239,
          72.94819449,
          28.45098243,
          56.7773427,
          57.18072715,
          18.70929771,
          25.45799278,
          58.9648607,
          27.78173764,
          34.00284858,
          15.96914958,
          22.10658198,
          15.39850609,
          56.17624052,
          43.69568578,
          0,
          53.19193663,
          40.3098056,
          34.8662935,
          57.63437426,
          39.56306311,
          37.54491619,
          13.02246349,
          36.24642764,
          42.13645908,
          21.96767426,
          0,
          23.17252404,
          15.2957464,
          42.77378838,
          39.23938591,
          41.58004288,
          40.74159193,
          52.85979803,
          37.03856496,
          64.33930302,
          0,
          43.29795978]

      }]
    };
});
