require 'spec_helper'

class FetchesLoans

  def initialize(kiva_client, storage_client, logger = STDOUT)
    @kiva_client    = kiva_client
    @storage_client = storage_client
    @logger         = logger
  end

  def fetch
    loans = kiva_client.loans
    storage_client.store(:loans, loans)
  rescue => e
    logger << e.message
    logger << e.backtrace
  end

private
  attr_reader :kiva_client, :storage_client, :logger
end

describe FetchesLoans do
  include_examples 'scrapes from Kiva and stores', described_class, :loans
end
