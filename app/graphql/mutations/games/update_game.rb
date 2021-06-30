# frozen_string_literal: true

module Mutations
  module Games
    class UpdateGame < ::Mutations::BaseMutation
      argument :game_id, Integer, required: true

      argument :player, String, required: true
      argument :board, Types::Input::BoardInputType, required: true

      type Types::GameType

      def resolve(game_id:, player:, board:)
        board_params = Hash board

        Game.find(game_id).tap do |game|
          game.update!(player: player)
          game.board.update(**board_params)

        rescue ActiveRecord::RecordInvalid => e
          GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
            " #{e.record.errors.full_messages.join(', ')}")
        end
      end
    end
  end
end

