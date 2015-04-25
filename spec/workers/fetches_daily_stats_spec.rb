require 'spec_helper'

describe FetchesDailyStats do
  include_examples 'scrapes from Kiva and stores', described_class, :stats
end
