# frozen_string_literal: true

module Queries
  module Games
    class FetchGames < Queries::BaseQuery
      type [Types::GameType], null: false

      def resolve
        Game.includes(:board, :plays).order(created_at: :desc)
      end
    end
  end
end
