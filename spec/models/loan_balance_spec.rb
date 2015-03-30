require 'spec_helper'
require 'bigdecimal'

describe LoanBalance do
  it 'validates uniqueness of balance_at' do
    LoanBalance.create(balance_at: Date.today)
    invalid_balance = LoanBalance.new(balance_at: Date.today)

    expect(invalid_balance).not_to be_valid
  end

  it 'validates presence of amount' do
    expect(LoanBalance.new(balance_at: Date.today)).not_to be_valid
    expect(LoanBalance.new(balance_at: Date.today, amount: BigDecimal.new('0.0'))).to be_valid
  end
end
