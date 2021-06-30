# frozen_string_literal: true

require 'rails_helper'

module Queries
  module Games
    RSpec.describe FetchGame, type: :request do
      let(:game_mock) { mock_model(Game) }

      let!(:games) { create_list(:game, 5) }

      let(:game) { games.first }

      describe '.fetchGameById' do
        context 'when a game exists and the request is valid' do
          it 'returns a game' do
            post '/graphql', params: { query: fetch_game_query(id: game.id) }

            json = JSON.parse(response.body)

            data = json['data']['fetchGameById']
            expect(data).not_to be_empty
            expect(data['id'].to_i).to eq(game.id)
          end
        end
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
    end
  end
end
