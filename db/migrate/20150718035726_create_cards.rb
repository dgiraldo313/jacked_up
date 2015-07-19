class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
 			t.string :suit, :value, :exercise

 			t.belongs_to :card_deck

      t.timestamps null: false
    end
  end
end
