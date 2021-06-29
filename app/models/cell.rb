# frozen_string_literal: true

class Cell < ApplicationRecord
  belongs_to :board

  enum kind: { void: 0, mine: 1 }

  validates_presence_of :x, :y, :kind

  def mines_neighbors?
    mines_neighbors.positive?
  end

  def not_mines_neighbors?
    !mines_neighbors?
  end
end
