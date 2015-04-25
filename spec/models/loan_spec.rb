require 'spec_helper'

describe Loan do
  let(:data) { {'id' => 99999} }

  describe '.new_from_json' do
    subject { Loan.new_from_json(data) }

    it 'extracts the id from the JSON' do

      expect(subject.loan_id).to eq(99999)
    end
  end

  describe 'attributes' do
    let(:data) { example_loan_data }

    subject { Loan.new_from_json(data) }

    it '#name' do
      expect(subject.name).to eq(data['name'])
    end

    it '#description' do
      expect(subject.description).to eq(data['description']['texts']['en'])
    end

    it '#status' do
      expect(subject.status).to eq(:in_repayment)
    end

    it '#tags' do
      expect(subject.tags).to eq(["#Parent", "#HealthAndSanitation", "#RepeatBorrower"])
    end
  end
end
