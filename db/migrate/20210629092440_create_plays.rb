class CreatePlays < ActiveRecord::Migration[6.1]
  def change
    create_table :plays do |t|
      t.integer :x
      t.integer :y
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
