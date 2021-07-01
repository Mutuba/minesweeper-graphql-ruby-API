# frozen_string_literal: true

require 'rails_helper'

module Mutations
  module Games
    RSpec.describe UpdateGame, type: :request do
      let!(:games) { create_list(:game, 5) }

      let(:game) { games.first }

      describe '.updateGame' do
        context 'when the request is valid' do
          before { post '/graphql', params: { query: update_game_query(game_id: game.id) } }

          it 'updates a game' do
            json = JSON.parse(response.body)
            data = json['data']['updateGame']

            expect(response).to have_http_status(200)
            expect(data).not_to be_empty
            expect(data['player']).to eq('Mutuba')
          end
        end
      end

      def update_game_query(game_id:)
        <<~GQL
          mutation {
            updateGame(input: {gameId: #{game_id}, player: "Mutuba", board: {rows: 10, cols: 10, minesPercentage: 10}}) {
              id
              over
              won
              player
            }
          }
        GQL
      end
    end
  end
end
