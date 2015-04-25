class StorageClient
  class UnknownStorageRequest < StandardError; end

  def store(requested_slot, value)
    send requested_slot, value

  rescue NoMethodError => e
    raise UnknownStorageRequest.new(e)
  end

  private

  def user_balance(attributes)
    LoanBalance.create(balance_at: attributes[:date], amount: BigDecimal.new(attributes[:value]))
  end

  def stats(attributes)
    DailyStats.create(
      loan_count: attributes['number_of_loans'],
      active_loan_count: attributes['num_paying_back'],
      amount_loaned: attributes['amount_of_loans'],
      amount_repaid: attributes['amount_repaid']
    )
  end

  def loans(attributes)
    return false unless attributes
    Loan.destroy_all
    attributes.each do |loan|
      Loan.new_from_json(loan).save!
    end
  end
end
