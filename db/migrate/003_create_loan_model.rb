class CreateLoanModel < ActiveRecord::Migration
  def change
    create_table :loans, id: false do |t|
      t.integer :loan_id, null: false
      t.json    :data,    null: false
      t.timestamps
    end
  end
end
