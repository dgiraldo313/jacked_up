class CreateCardDecks < ActiveRecord::Migration
  def change
    create_table :card_decks do |t|
    	t.belongs_to :workout
    	t.
      t.timestamps null: false
    end
  end
end
