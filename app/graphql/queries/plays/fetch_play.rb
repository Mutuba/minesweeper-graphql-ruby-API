# frozen_string_literal: true

module Queries
  module Plays
    class FetchPlay < ::Queries::BaseQuery
      type Types::PlayType, null: false
      argument :id, ID, required: true

      def resolve(id)
        Play.includes(:game).find id[:id]
      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new('Game does not exist.')
      end
    end
  end
end
