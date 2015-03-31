# encoding: utf-8

class FetchesKivaBalance
  def initialize(kiva_client, storage_client, logger = STDOUT)
    @kiva_client    = kiva_client
    @storage_client = storage_client
    @logger         = logger
  end

  def fetch
    balance = kiva_client.user_balance

    storage_client.store(:user_balance, date: Date.today, value: balance)
  rescue => e
    logger << e.message
    logger << e.backtrace
  end

  private

  attr_reader :kiva_client, :storage_client, :logger
end
