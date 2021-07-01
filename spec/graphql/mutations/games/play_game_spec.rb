# frozen_string_literal: true

require 'rails_helper'

module Mutations
  module Games
    RSpec.describe PlayGame, type: :request do
      let!(:games) { create_list(:game, 5) }

      let(:game) { games.first }

      describe '.playGame' do
        context 'when a game exists and the request is valid' do
          before { post '/graphql', params: { query: first_move_query(game_id: game.id) } }

          it 'creates a move for the game' do
            post '/graphql', params: { query: second_move_query(game_id: game.id) }

            json = JSON.parse(response.body)
            data = json['data']['playGame']
            expect(data).not_to be_empty
          end
        end

        context 'when a game does not exist' do
          before { allow(game.class).to receive(:find).with(game.id).and_raise(ActiveRecord::RecordNotFound.new) }

          it 'returns 404 not found ' do
            post '/graphql', params: { query: play_game_query(game_id: game.id) }

            json = JSON.parse(response.body)
            message = json['errors'][0]['message']
            expect(message).to eq 'Game does not exist.'
          end
        end
      end

      def play_game_query(game_id:)
        <<~GQL
          mutation {
            playGame(input: {move: {x: 1, y: 1}, gameId: #{game_id}}) {
              id
              x
              y
              game {
                id
                over
                player
                won
                board {
                  cols
                  id
                  minesPercentage
                  rows
                  cells {
                    id
                    minesNeighbors
                    x
                    y
                  }
                }
              }
            }
          }
        GQL
      end

      def first_move_query(game_id:)
        <<~GQL
          mutation {
            playGame(input: {move: {x: 1, y: 1}, gameId: #{game_id}}) {
              id
              x
              y
              game {
                id
                over
                player
                won
                board {
                  cols
                  id
                  minesPercentage
                  rows
                  cells {
                    id
                    minesNeighbors
                    x
                    y
                  }
                }
              }
            }
          }
        GQL
      end

      def second_move_query(game_id:)
        <<~GQL
          mutation {
            playGame(input: {move: {x: 2, y: 2}, gameId: #{game_id}}) {
              id
              x
              y
              game {
                id
                over
                player
                won
                board {
                  cols
                  id
                  minesPercentage
                  rows
                  cells {
                    id
                    minesNeighbors
                    x
                    y
                  }
                }
              }
            }
          }
        GQL
      end
    end
  end
end
