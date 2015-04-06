require 'spec_helper'

describe FetchesDailyStats do
  let(:kiva_client) { double }
  let(:storage_client) { double }

  subject { FetchesDailyStats.new(kiva_client, storage_client) }

  it 'uses the Kiva Client to retrieve the balance' do
    allow(storage_client).to receive(:store)
    expect(kiva_client).to receive(:stats)

    subject.fetch
  end

  it 'uses the Storage Client to store the balance somewhere' do
    allow(kiva_client).to receive(:stats).and_return(sample_stats_response)
    expect(storage_client).to receive(:store).with(:stats, sample_stats_response)

    subject.fetch
  end

  it 'logs any errors to STDOUT' do
    allow(kiva_client).to receive(:stats).and_raise('BURNINATE')
    expect(STDOUT).to receive(:<<).at_least(:once)

    subject.fetch
  end


  def sample_stats_response
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
end
