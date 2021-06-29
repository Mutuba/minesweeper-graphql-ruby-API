# frozen_string_literal: true

FactoryBot.define do
  factory :game do
    player { 'Mutuba' }
    board_attributes factory: :board
    # board_attributes { association :board }
  end
end
