var kivaSnapshot = angular.module('kivaSnapshot', []);

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
  $scope.loaner = {
    name: "James Griffiths"
  };
});


kivaSnapshot.controller('AvailableBalanceController', function($scope) {
  $scope.balance = 55;
});

kivaSnapshot.controller('AmountLentController', function($scope) {
  $scope.total_lent = 1000;
});
