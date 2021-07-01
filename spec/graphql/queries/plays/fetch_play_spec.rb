# frozen_string_literal: true

require 'rails_helper'

module Queries
  module Plays
    RSpec.describe FetchPlay, type: :request do
      let!(:play) { create(:play) }

      describe '.fetchPlayById' do
        context 'when a game exists and the request is valid' do
          it 'returns a game' do
            post '/graphql', params: { query: fetch_play_query(id: play.id) }

            json = JSON.parse(response.body)

            data = json['data']['fetchPlayById']
            expect(data).not_to be_empty
            expect(data['id'].to_i).to eq(play.id)
          end
        end
      end

      def fetch_play_query(id:)
        <<~GQL
          query {
                fetchPlayById(id: #{id}) {
                    game {
                      id
                      over
                      player
                      won
                    }
                    id
                    x
                    y
                  }
          }

        GQL
      end
    end
  end
end
