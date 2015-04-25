# encoding: utf-8

def example_loan_data

  JSON.parse <<-JSON
[
    {
      "id": 857045,
      "name": "Lim",
      "description": {
        "languages": [
          "en"
        ]
      },
      "status": "in_repayment",
      "funded_amount": 1125,
      "paid_amount": 0,
      "image": {
        "id": 1838204,
        "template_id": 1
      },
      "activity": "Farming",
      "sector": "Agriculture",
      "use": "to buy a plot of farmland for growing rice",
      "location": {
        "country_code": "KH",
        "country": "Cambodia",
        "town": "Kampong Cham",
        "geo": {
          "level": "town",
          "pairs": "12 105.5",
          "type": "point"
        }
      },
      "partner_id": 106,
      "posted_date": "2015-03-22T18:20:02Z",
      "planned_expiration_date": "2015-04-21T18:20:02Z",
      "loan_amount": 1125,
      "borrower_count": 1,
      "lender_count": 34,
      "bonus_credit_eligibility": false,
      "tags": [
        {
          "name": "#WomanOwnedBiz"
        },
        {
          "name": "#Vegan"
        },
        {
          "name": "#Parent"
        }
      ]
    },
    {
      "id": 829958,
      "name": "Nhuận",
      "description": {
        "languages": [
          "en"
        ]
      },
      "status": "in_repayment",
      "funded_amount": 725,
      "paid_amount": 0,
      "image": {
        "id": 1797395,
        "template_id": 1
      },
      "activity": "Personal Housing Expenses",
      "sector": "Housing",
      "themes": [
        "Water and Sanitation"
      ],
      "use": "to purchase sand, cement, brick and equipment to build a toilet.",
      "location": {
        "country_code": "VN",
        "country": "Vietnam",
        "town": "Thanh Hoá",
        "geo": {
          "level": "country",
          "pairs": "16.166667 107.833333",
          "type": "point"
        }
      },
      "partner_id": 121,
      "posted_date": "2015-01-20T04:30:02Z",
      "planned_expiration_date": "2015-02-19T04:30:02Z",
      "loan_amount": 725,
      "borrower_count": 1,
      "lender_count": 23,
      "bonus_credit_eligibility": true,
      "tags": [
        {
          "name": "#Parent"
        },
        {
          "name": "#HealthAndSanitation"
        },
        {
          "name": "#RepeatBorrower"
        }
      ]
    }
  ]
  JSON
end
