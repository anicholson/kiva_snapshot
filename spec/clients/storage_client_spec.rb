#encoding: utf-8
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
          expect { subject.store(:user_balance, date: Date.today, balance: '100.00') }.to change { LoanBalance.count }.by 1
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

        describe ':loans' do
          subject { StorageClient.new.store(:loans, loan_data) }
          context 'passed loan data' do
            let(:loan_data) { example_combined_loan_data }
            it 'deletes all existing loans' do
              expect(Loan).to receive(:destroy_all)

              subject
            end

            it 'creates new loans from the array of data' do
              expect { subject }.to change { Loan.count }.by(2)
            end
          end

          context 'passed incorrect data:' do
            let(:loan_data) { @data }

            [nil, '[]', ''].each do |missing|
              @data = missing

              it 'does not delete existing loans' do
                expect(Loan).not_to receive(:destroy_all)
                subject
              end

              it 'does not create any new loans' do
                expect(Loan).not_to receive(:create)
              end
            end
          end
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
