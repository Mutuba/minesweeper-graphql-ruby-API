# frozen_string_literal: true

module Mutations
  module Games
    class CreateGame < ::Mutations::BaseMutation
      argument :player, String, required: true
      argument :board, Types::Input::BoardInputType, required: true

      field :game, Types::GameType, null: false

      def resolve(player:, board:)
        board_params = Hash board
        @game = Game.create!(player: player)
        Board.create!(game: @game, **board_params)
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
