# frozen_string_literal: true

module Queries
  module Plays
    class FetchPlays < ::Queries::BaseQuery
      type [Types::PlayType], null: false

      def resolve
        Play.includes(:game).order(created_at: :desc)
      end
    end
  end
end
