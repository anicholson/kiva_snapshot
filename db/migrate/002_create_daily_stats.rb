class CreateDailyStats < ActiveRecord::Migration
  def change
    create_table :daily_stats do |t|
      t.integer :loan_count
      t.integer :active_loan_count
      t.decimal :amount_loaned, precision: 10, places: 2
      t.decimal :amount_repaid, precision: 10, places: 2
      t.timestamps
    end
  end
end
