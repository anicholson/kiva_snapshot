require 'spec_helper'

describe Loan do
  let(:data) { instance_double(Hash) }

  describe '.new_from_json' do
    subject { Loan.new_from_json(data) }

    it 'extracts the id from the JSON' do
      allow(data).to receive(:[]).with('id').and_return 99999

      expect(subject.loan_id).to eq(99999)
    end
  end
end
