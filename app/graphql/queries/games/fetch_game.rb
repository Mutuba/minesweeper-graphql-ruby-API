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
      end
    end
  end
end
