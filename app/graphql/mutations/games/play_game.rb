# frozen_string_literal: true

module Mutations
  module Games
    class PlayGame < ::Mutations::BaseMutation
      argument :move, Types::Input::MoveInputType, required: true

      argument :game_id, Integer, required: true

      type Types::PlayType

      def resolve(game_id:, move:)
        move_params = Hash move
        @game = Game.find(game_id)
        @game.play!(move_params)
      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new('Game does not exist.')
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new('Invalid attributes for move')
      end
    end
  end
end
