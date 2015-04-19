class Loan < ActiveRecord::Base
  class << self
    def new_from_json(json_data)
      new(
        loan_id: json_data['id'],
        data:    json_data
      )
    end
  end
end
