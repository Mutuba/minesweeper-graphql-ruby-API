# frozen_string_literal: true

class CreateCells < ActiveRecord::Migration[6.1]
  def change
    create_table :cells do |t|
      t.integer :x
      t.integer :y
      t.integer :mines_percentage
      t.boolean :played
      t.integer :mines_neighbors
      t.integer :kind
      t.references :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
