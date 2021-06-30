# frozen_string_literal: true

module Mutations
  module Games
    class DeleteGame < ::Mutations::BaseMutation
      argument :game_id, Integer, required: true

      def resolve(game_id:)
        Game.find(game_id).destroy!
      rescue ActiveRecord::RecordNotDestroyed => _e
        GraphQL::ExecutionError.new('Game not destroyed')
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
            " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
