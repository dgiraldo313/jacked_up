class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|

    	t.belongs_to :user

      t.timestamps :created_at, :updated_at
    end
  end
end
