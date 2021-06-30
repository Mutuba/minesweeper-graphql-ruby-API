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
        @game.board.cells.find_by! move_params
        @game.play!(move_params)
      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new('Game or Move does not exist.')
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
            " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
