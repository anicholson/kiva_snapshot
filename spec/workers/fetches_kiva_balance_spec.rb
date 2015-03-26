require 'spec_helper'

describe FetchesKivaBalance do
  let(:kiva_client) { double }
  let(:storage_client) { double }

  subject { FetchesKivaBalance.new(kiva_client, storage_client) }

  it 'uses the Kiva Client to retrieve the balance' do
    allow(storage_client).to receive(:store)
    expect(kiva_client).to receive(:user_balance)

    subject.fetch
  end

  it 'uses the Storage Client to store the balance somewhere' do
    allow(kiva_client).to receive(:user_balance).and_return(1000)
    expect(storage_client).to receive(:store).with(:user_balance, date: Date.today, value: 1000)

    subject.fetch
  end

  it 'logs any errors to STDOUT' do
    allow(kiva_client).to receive(:user_balance).and_raise('BURNINATE')
    expect(STDOUT).to receive(:puts).with('BURNINATE')

    subject.fetch
  end
end
