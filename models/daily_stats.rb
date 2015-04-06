class DailyStats < ActiveRecord::Base

  def self.latest
    order('created_at DESC').first || unavailable_daily_stats
  end

  class << self
    private

    def unavailable_daily_stats
      OpenStruct.new(
        loan_count: 0,
        active_loan_count: 0,
        amount_loaned: Float::NAN,
        amount_repaid: Float::NAN
      )
    end
  end
end
