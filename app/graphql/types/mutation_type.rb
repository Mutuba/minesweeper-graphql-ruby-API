# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_game, mutation: Mutations::Games::CreateGame
    field :play_game, mutation: Mutations::Games::PlayGame

    field :update_game, mutation: Mutations::Games::UpdateGame
  end
end
