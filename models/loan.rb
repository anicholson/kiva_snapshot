class Loan < ActiveRecord::Base
  class << self
    def new_from_json(json_data)
      new.tap do |loan|
        loan.loan_id = json_data['id']
        loan.data    = json_data
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
end
