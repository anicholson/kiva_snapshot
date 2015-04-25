shared_examples 'scrapes from Kiva and stores' do |worker_class, client_method|
  let(:kiva_client)    { instance_double KivaClient    }
  let(:storage_client) { instance_double StorageClient }
  let(:sample_response) { double }

  subject { worker_class.new(kiva_client, storage_client) }

  it 'uses the Kiva Client to retrieve the balance' do
    allow(storage_client).to receive(:store)
    expect(kiva_client).to receive(client_method)

    subject.fetch
  end

  it 'uses the Storage Client to store the balance somewhere' do
    allow(kiva_client).to receive(client_method).and_return(sample_response)
    expect(storage_client).to receive(:store).with(client_method, sample_response)

    subject.fetch
  end

  it 'logs any errors to STDOUT' do
    allow(kiva_client).to receive(client_method).and_raise('BURNINATE')
    expect(STDOUT).to receive(:<<).at_least(:once)

    subject.fetch
  end
end
