# frozen_string_literal: true

require 'rails_helper'

module Mutations
  module Games
    RSpec.describe CreateGame, type: :request do
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

      describe '.updateGame' do
        context 'when the request is valid' do
          before { post '/graphql', params: { query: update_game_query(game_id: game.id) } }

          it 'updates a game' do
            json = JSON.parse(response.body)
            data = json['data']['updateGame']

            expect(response).to have_http_status(200)
            expect(data).not_to be_empty
            expect(data['player']).to eq("Mutuba")
          end
        end
      end

      describe '.fetchAllGames' do
        context 'when a task exists and the request is valid' do
          it 'returns a game' do
            post '/graphql', params: { query: fetch_all_games_query }

            json = JSON.parse(response.body)

            data = json['data']['fetchAllGames']
            expect(data.size).to eq 5
            expect(data).not_to be_empty
          end
        end
      end
      describe '.fetchGameById' do
        context 'when a task exists and the request is valid' do
          it 'returns a game' do
            post '/graphql', params: { query: fetch_game_query(id: game.id) }

            json = JSON.parse(response.body)

            data = json['data']['fetchGameById']
            expect(data).not_to be_empty
            expect(data['id'].to_i).to eq(game.id)
            
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

      def fetch_game_query(id:)
        <<~GQL
          query {
              fetchGameById(id: #{id}) {
                  id
                  player
                  over
                  won
                }
          }

        GQL
      end

      def fetch_all_games_query
        <<~GQL
          query {
            fetchAllGames {
              over
              id
              player
              won
            }
          }

        GQL
      end
    end
  end
end
