# frozen_string_literal: true

module Types
  module Input
    class BoardInputType < Types::BaseInputObject
      argument :rows, Integer, required: true
      argument :cols, Integer, required: true
      argument :mines_percentage, Integer, required: true
    end
  end
end
