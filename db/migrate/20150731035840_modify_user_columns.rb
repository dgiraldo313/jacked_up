class ModifyUserColumns < ActiveRecord::Migration
  def change
  	rename_column :users, :name, :first_name
  	add_column :users, :last_name, :string
  	add_column :users, :password_digest, :string
  	remove_column :users, :age, :integer
  	add_index :users, :email
  	add_column :users, :password_reset_token, :string
  end
end
