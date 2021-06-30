# frozen_string_literal: true

module Types
  class PlayType < GraphQL::Schema::Object
    field :id, ID, null: false

    field :x, Int, null: false
    field :y, Int, null: false

    field :game, GameType, null: false
  end
end
