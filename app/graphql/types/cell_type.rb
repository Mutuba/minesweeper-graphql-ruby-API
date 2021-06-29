# frozen_string_literal: true

module Types
  class CellType < GraphQL::Schema::Object
    field :id, ID, null: false

    field :x, Int, null: false
    field :y, Int, null: false
    field :played, Boolean, null: false
  end
end
