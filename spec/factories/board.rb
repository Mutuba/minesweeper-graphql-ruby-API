# frozen_string_literal: true

FactoryBot.define do
  factory :board do
    rows { 20 }
    cols { 30 }
    mines_percentage { 20 }
  end
end
