require 'pry'

class Loan < ActiveRecord::Base
  has_one :loan_user
  has_one :user, through: :loan_user
  self.primary_key = 'loan_id'

  default_scope { order("data->>'funded_date' DESC") }

  class << self
    def new_from_json(json_data)
      new.tap do |loan|
        loan.loan_id  = json_data['data']['id']
        loan.data     = json_data['data']
        loan.balances = json_data['balances']
      end
    end
  end

  def name
    data['name']
  end

  def description
    data['description']['texts']['en']
  rescue => e
    'No English description available'
  end

  def status
    data['status'].to_sym
  end

  def tags
    data['tags'].map {|tag| tag['name'] }
  end

  def amount_we_loaned
    BigDecimal.new(balances['amount_purchased_by_lender'])
  end
end
