# frozen_string_literal: true

module Types
  module Input
    class MoveInputType < Types::BaseInputObject
      argument :x, Integer, required: true
      argument :y, Integer, required: true
    end
  end
end
