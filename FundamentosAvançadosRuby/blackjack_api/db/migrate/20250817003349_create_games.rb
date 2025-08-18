class CreateGames < ActiveRecord::Migration[7.2]
  def change
    create_table :games do |t|
      t.jsonb :player_hand, default: []
      t.jsonb :dealer_hand, default: []
      t.string :status, default: 'ongoing'
      t.string :winner

      t.timestamps
    end
  end
end
