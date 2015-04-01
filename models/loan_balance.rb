class LoanBalance < ActiveRecord::Base
  validates :balance_at, uniqueness: true
  validates :amount, presence: true

  def self.latest
    order('balance_at DESC').first || OpenStruct.new(amount: 0.0)
  end
end
