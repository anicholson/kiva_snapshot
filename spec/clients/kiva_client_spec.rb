require 'spec_helper'
require 'ostruct'

describe KivaClient do
  let(:test_http_client) { double('HTTP client') }
  let(:test_response) do
    OpenStruct.new( body:
      {
        "user_balance" => {
        "id" => 1462849,
        "balance" => "8.17",
        "promo_balance" => "0.00"
        }
      }
    )
  end

  describe '#user_balance' do
    before do
      allow(subject).to receive(:http).and_return(test_http_client)
      allow(test_http_client).to receive(:get).with('/v1/my/balance.json').and_return(test_response)
    end

    it 'COMMAND: should call out to the Kiva API' do
      expect(test_http_client).to receive(:get).with('/v1/my/balance.json')

      subject.user_balance
    end

    it 'QUERY: should return my balance, in cents' do
      expect(subject.user_balance).to eq(817)
    end
  end
end
