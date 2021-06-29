# frozen_string_literal: true

FactoryBot.define do
  factory :play do
    x { 5 }
    y { 5 }

    game factory: :game
  end
end
