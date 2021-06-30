# frozen_string_literal: true

FactoryBot.define do
  factory :cell do
    kind { :void }
    x { 5 }
    y { 5 }
  end
end
