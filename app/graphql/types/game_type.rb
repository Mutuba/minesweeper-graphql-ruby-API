# frozen_string_literal: true

module Types
  class GameType < Types::BaseObject
    field :id, ID, null: false
    field :player, String, null: false
    field :board, String, null: false
  end
end
