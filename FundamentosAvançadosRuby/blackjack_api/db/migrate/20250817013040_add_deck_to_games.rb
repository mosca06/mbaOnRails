class AddDeckToGames < ActiveRecord::Migration[7.2]
  def change
    add_column :games, :deck, :jsonb
  end
end
