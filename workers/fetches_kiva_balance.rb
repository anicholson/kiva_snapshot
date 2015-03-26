# encoding: utf-8

class FetchesKivaBalance
  def initialize(kiva_client, storage_client)
    @kiva_client    = kiva_client
    @storage_client = storage_client
  end

  def fetch
    balance = kiva_client.user_balance

    storage_client.store(:user_balance, date: Date.today, value: balance)
  rescue => e
    STDOUT.puts e.message
  end

  private

  attr_reader :kiva_client, :storage_client
end
