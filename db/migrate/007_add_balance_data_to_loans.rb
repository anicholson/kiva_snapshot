class AddBalanceDataToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :balances, :json
  end
end
