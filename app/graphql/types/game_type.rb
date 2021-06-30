# frozen_string_literal: true

module Types
  class GameType < GraphQL::Schema::Object
    field :id, ID, null: false
    field :player, String, null: false
    field :won, Boolean, null: false
    field :over, Boolean, null: false
    field :board, BoardType, null: false
  end
end
