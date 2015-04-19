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
end
