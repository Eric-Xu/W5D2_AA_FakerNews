class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :remember_token
      t.integer :karma
      t.text :about

      t.timestamps
    end
    add_index :users, :username, :unique => true
    add_index :users, :remember_token, :unique => true
  end
end
