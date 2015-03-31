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
end
