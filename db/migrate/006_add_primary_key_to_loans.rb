class AddPrimaryKeyToLoans < ActiveRecord::Migration
  def up
   execute "ALTER TABLE loans ADD PRIMARY KEY (loan_id)"
  end
end
