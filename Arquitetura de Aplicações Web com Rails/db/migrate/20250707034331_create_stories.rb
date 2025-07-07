class CreateStories < ActiveRecord::Migration[8.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :body
      t.boolean :published

      t.timestamps
    end
  end
end
