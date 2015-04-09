module Routing
  module API
    def self.registered(app)
      app.namespace '/api' do
        get '/user_balance.json' do
          balance = LoanBalance.latest

          json({
                 updatedAt: balance.balance_at,
                 amount:    (balance.amount / 100.0).to_f
               })
        end

        get '/stats.json' do
          stats = DailyStats.latest
          json({
                 loanCount:    stats.loan_count,
                 activeLoans:  stats.active_loan_count,
                 amountLoaned: stats.amount_loaned,
                 amountRepaid: stats.amount_repaid,
                 updatedAt:    stats.created_at
               })
        end

        get '/available_vs_loaned.json' do
          available = LoanBalance.last(90).map do |balance|
            {
              x: balance.balance_at.to_datetime.to_i * 1000,
              y: balance.amount.to_f
            }
          end

          loaned = DailyStats.last(90).map do |stats|
            {
              x: stats.created_at.to_i * 1000,
              y: stats.amount_loaned.to_f
            }
          end
          json({
                 available: available,
                 loaned:    loaned
               })
        end
      end
    end
  end
end
