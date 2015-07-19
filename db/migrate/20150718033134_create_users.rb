class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name, :email
    	t.integer :age

      t.timestamps null: false
    end
  end
end
