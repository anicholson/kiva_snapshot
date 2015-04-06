require 'spec_helper'

describe StorageClient do
  describe '#store' do
    context 'provided known storage request' do
      it 'calls the correct method' do
        expect(subject).to receive(:user_balance).with(:argument)
        subject.store(:user_balance, :argument)
      end

      describe 'known slots' do
        it ':user_balance creates a LoanBalance object' do
          expect { subject.store(:user_balance, date: Date.today, value: '100.00') }.to change { LoanBalance.count }.by 1
        end

        it ':stats creates a DailyStats object' do
          expect do
            subject.store(:stats,
                          'num_paying_back' => 1,
                          'number_of_loans' => 3,
                          'amount_of_loans' => BigDecimal.new('123.00'),
                          'amount_repaid'   => BigDecimal.new('65.43'))
          end.to change { DailyStats.count }.by 1
        end
      end
    end

    context 'provided unknown storage request' do
      it 'returns an error' do
        expect { subject.store(:funky_cold_medina, true) }.to raise_error(StorageClient::UnknownStorageRequest)
      end
    end
  end
end
