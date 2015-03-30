class LoanBalance < ActiveRecord::Base
  validates :balance_at, uniqueness: true
  validates :amount, presence: true
end
