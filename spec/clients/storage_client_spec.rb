require 'spec_helper'

describe StorageClient do
  describe '#store' do
    context 'provided known storage request' do
      it 'calls the correct method' do
        expect(subject).to receive(:user_balance).with(:argument)
        subject.store(:user_balance, :argument)
      end

      it 'creates a LoanBalance object' do
        expect(LoanBalance).to receive(:create).with(balance_at: Date.today, amount: BigDecimal.new('100.00'))

        subject.store(:user_balance, '100.00')
      end
    end

    context 'provided unknown storage request' do
      it 'returns an error' do
        expect { subject.store(:funky_cold_medina, true) }.to raise_error(StorageClient::UnknownStorageRequest)
      end
    end
  end
end
