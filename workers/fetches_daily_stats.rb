class FetchesDailyStats
  def initialize(kiva_client, storage_client, logger=STDOUT)
    @kiva_client    = kiva_client
    @storage_client = storage_client
    @logger         = logger
  end

  def fetch
    raw_stats = kiva_client.stats

    storage_client.store(:stats, raw_stats)
  rescue => e
    logger << e.message
    logger << e.backtrace
  end

  private

  attr_reader :kiva_client, :storage_client, :logger
end
