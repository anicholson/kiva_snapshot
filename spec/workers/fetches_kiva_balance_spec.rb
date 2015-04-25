require 'spec_helper'

describe FetchesKivaBalance do
  include_examples 'scrapes from Kiva and stores', described_class, :user_balance
end
