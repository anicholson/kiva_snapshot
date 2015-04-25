#encoding: utf-8
require 'spec_helper'
require 'ostruct'

describe KivaClient do
  let(:test_http_client) { double('HTTP client') }
  let(:test_response) { OpenStruct.new( body: response_hash ) }

  before { allow(subject).to receive(:http).and_return(test_http_client) }

  describe '#user_balance' do
    let(:response_hash) do
      {
        "user_balance" => {
          "id"            => 1462849,
          "balance"       => "8.17",
          "promo_balance" => "0.00"
        }
      }
    end

    before { allow(test_http_client).to receive(:get).with('/v1/my/balance.json').and_return(test_response) }

    it 'COMMAND: should call out to the Kiva API' do
      expect(test_http_client).to receive(:get).with('/v1/my/balance.json')

      subject.user_balance
    end

    it 'QUERY: should return my balance, in cents' do
      expect(subject.user_balance[:balance]).to eq(817)
    end
  end

  describe '#stats' do
    let(:response_hash) do
      {
        "number_of_loans"             => 15,
        "amount_of_loans"             => 1150,
        "number_of_invites"           => 0,
        "number_of_gift_certificates" => 0,
        "number_of_loans_by_invitees" => 0,
        "amount_of_loans_by_invitees" => 0,
        "amount_repaid"               => 428.67,
        "default_rate"                => 0,
        "num_defaulted"               => 0,
        "total_defaulted"             => 0,
        "num_refunded"                => 0,
        "total_refunded"              => 0,
        "num_inactive"                => 0,
        "total_inactive"              => 0,
        "num_ended"                   => 3,
        "total_ended"                 => 150,
        "num_fund_raising"            => 0,
        "total_fund_raising"          => 0,
        "num_raised"                  => 0,
        "num_paying_back"             => 12,
        "total_paying_back"           => 1000,
        "currency_loss"               => -0.32,
        "currency_loss_rate"          => 0.03,
        "amount_outstanding"          => 721.01,
        "num_inactive_expired"        => 0,
        "total_inactive_expired"      => 0,
        "num_expired"                 => 0,
        "total_expired"               => 0,
        "arrears_rate"                => 0.0184,
        "amount_in_arrears"           => 13.2676,
        "number_delinquent"           => 2,
        "amount_refunded"             => 0,
        "amount_donated"              => 0,
        "amount_outstanding_promo"    => 0
      }
    end

    before { allow(test_http_client).to receive(:get).with('/v1/my/stats.json').and_return(test_response) }

    it 'COMMAND: should call out to the Kiva API' do
      expect(test_http_client).to receive(:get).with('/v1/my/stats.json')

      subject.stats
    end

    it 'QUERY: should return useful statistics, in cents' do
      result = subject.stats

      expect(result['number_of_loans']).to eq(15)
      expect(result['amount_of_loans']).to eq(BigDecimal.new('115000'))
    end
  end

  describe '#loans' do
    let(:response_hash) do
      JSON.parse <<-JSON
{
  "paging": {
    "page": 1,
    "total": 2,
    "page_size": 20,
    "pages": 1
  },
  "loans": [
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
}
      JSON
    end

    let(:loan_array) { OpenStruct.new(body: {'loans' => []})}
    before { allow(test_http_client).to receive(:get).with('/v1/my/loans.json').and_return(test_response) }

    it 'COMMAND: should call out to the Kiva API' do
      expect(test_http_client).to receive(:get).with('/v1/my/loans.json')
      expect(test_http_client).to receive(:get).with('/v1/loans/857045,829958.json').and_return(loan_array)
      subject.loans
    end

    it 'QUERY: should return an array of loans' do
      allow(test_http_client).to receive(:get).with('/v1/loans/857045,829958.json').and_return(loan_array)
      expect(subject.loans).to be_an(Array)
    end

  end
end
