require 'spec_helper'

describe FetchesLoans do
  include_examples 'scrapes from Kiva and stores', described_class, :loans
end
