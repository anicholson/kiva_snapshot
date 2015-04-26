class CreateLoansUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :loan_users, id: false do |t|
      t.references :user, nil: false
      t.references :loan, nil: false
      t.timestamps
    end
  end
end
