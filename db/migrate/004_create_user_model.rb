class CreateUserModel < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name, nil: false
      t.string  :email
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
