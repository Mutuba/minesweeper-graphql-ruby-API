# frozen_string_literal: true

module Queries
  module Games
    class FetchGame < ::Queries::BaseQuery
      type Types::GameType, null: false
      argument :id, ID, required: true

      def resolve(id)
        Game.includes(:plays, board: :cells).find id[:id]
      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new('Game does not exist.')
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
            " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
