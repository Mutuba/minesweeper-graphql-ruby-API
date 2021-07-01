# frozen_string_literal: true

require 'rails_helper'

module Mutations
  module Games
    RSpec.describe CreateGame, type: :request do
      let!(:game) { create(:game) }
      describe '.CreateGame' do
        context 'when the request is valid' do
          let(:create_game) { post '/graphql', params: { query: create_game_query } }

          it 'creates a game' do
            expect { create_game }.to change { Game.count }.by(1)
          end
        end

        context 'when the query is invalid' do
          before do
            allow(game.class).to receive(:create!).with(player: 'Mutuba').and_raise(ActiveRecord::RecordInvalid.new)
          end

          it 'returns 404 not found ' do
            post '/graphql', params: { query: create_game_invalid_query }

            json = JSON.parse(response.body)
            message = json['errors'][0]['message']
            expect(message).to eq 'Invalid attributes for game'
          end
        end
      end
      def create_game_query
        <<~GQL
          mutation {
            createGame(input: {player: "Mutuba", board: {rows: 10, cols: 10, minesPercentage: 10}}) {
              game {
                id
                over
                player
                won
              }
            }
          }
        GQL
      end

      def create_game_invalid_query
        <<~GQL
          mutation {
            createGame(input: {player: "Mutuba", board: {rows: 10, cols: 10, minesPercentage: 10}}) {
              game {
                id
                over
                player
                won
              }
            }
          }
        GQL
      end
    end
  end
end
