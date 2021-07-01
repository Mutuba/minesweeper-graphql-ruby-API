# frozen_string_literal: true

require 'rails_helper'

module Queries
  module Games
    RSpec.describe FetchGames, type: :request do
      let!(:games) { create_list(:game, 5) }

      let(:game) { games.first }

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
