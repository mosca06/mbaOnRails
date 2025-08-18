class CreateMoves < ActiveRecord::Migration[7.2]
  def change
    create_table :moves do |t|
      t.references :game, null: false, foreign_key: true
      t.string :move_type, null: false

      t.timestamps
    end
  end
end
