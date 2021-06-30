# frozen_string_literal: true

FactoryBot.define do
  factory :game do
    player { 'Mutuba' }
    after(:build) do |game|
      game.board ||= FactoryGirl.build(:board, game: game)
    end
  end
end
