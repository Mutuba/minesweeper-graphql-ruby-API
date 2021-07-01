# frozen_string_literal: true

require 'rails_helper'

module Queries
  module Plays
    RSpec.describe FetchPlays, type: :request do
      let!(:plays) { create_list(:play, 5) }

      let(:play) { plays.first }

      describe '.fetchAllPlays' do
        context 'when a task exists and the request is valid' do
          it 'returns a game' do
            post '/graphql', params: { query: fetch_all_plays_query }

            json = JSON.parse(response.body)

            data = json['data']['fetchAllPlays']
            expect(data.size).to eq 5
            expect(data).not_to be_empty
          end
        end
      end
      def fetch_all_plays_query
        <<~GQL
          query {
            fetchAllPlays {
                x
                y
                game {
                  board {
                    cols
                    minesPercentage
                    id
                    rows
                  }
                  id
                  over
                  won
                  player
                }
                id
              }
          }

        GQL
      end
    end
  end
end
