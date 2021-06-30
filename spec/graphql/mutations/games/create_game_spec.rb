# frozen_string_literal: true

require 'rails_helper'

module Mutations
  module Games
    RSpec.describe CreateGame, type: :request do
      let(:game_mock) { mock_model(Game) }

      let!(:games) { create_list(:game, 5) }

      let(:game) { games.first }
      describe '.CreateGame' do
        context 'when the request is valid' do
          let(:create_game) { post '/graphql', params: { query: create_game_query } }

          it 'creates a game' do
            expect { create_game }.to change { Game.count }.by(1)
          end
        end
      end
      def create_game_query
        <<~GQL
          mutation {
            createGame(input: {player: "Mutuba", board: {rows: 10, cols: 10, minesPercentage: 10}}) {
              id
            }
          }
        GQL
      end
    end
  end
end
