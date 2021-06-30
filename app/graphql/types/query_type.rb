# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :fetch_all_games, resolver: Queries::Games::FetchGames, description: 'List all games'
    field :fetch_game_by_id, resolver: Queries::Games::FetchGame, description: 'Find a game by ID'

    field :fetch_play_by_id, resolver: Queries::Plays::FetchPlay, description: 'Find a play/move by ID'
    field :fetch_all_plays, resolver: Queries::Plays::FetchPlays, description: 'List all plays/moves'
  end
end
