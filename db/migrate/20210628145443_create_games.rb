# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :player
      t.boolean :won, default: false
      t.boolean :over, default: false

      t.timestamps
    end
  end
end
