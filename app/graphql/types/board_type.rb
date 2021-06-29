# frozen_string_literal: true

module Types
  class BoardType < GraphQL::Schema::Object
    field :id, ID, null: false

    field :rows, Int, null: false
    field :cols, Int, null: false
    field :mines_percentage, Int, null: false
    field :cells, CellType, null: false
  end
end
