class StorageClient
  class UnknownStorageRequest < StandardError; end

  def store(requested_slot, value)
    send requested_slot, value

  rescue NoMethodError => e
    raise UnknownStorageRequest.new(e)
  end

  private

  def user_balance(amount)
    LoanBalance.create(balance_at: Date.today, amount: BigDecimal.new(amount))
  end
end
