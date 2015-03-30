class CreateLoanBalances < ActiveRecord::Migration
  def change
    create_table :loan_balances do |t|
      t.date    :balance_at,                       null: false
      t.decimal :amount, precision: 10, places: 2, null: false
    end

    add_index :loan_balances, [:balance_at], unique: true
  end
end
