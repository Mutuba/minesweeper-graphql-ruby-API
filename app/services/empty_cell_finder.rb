# frozen_string_literal: true

class EmptyCellFinder
  include Neighbour

  def initialize(board, move)
    @board = board
    @move = move
  end

  def find!
    @empties    = []
    @cells      = @board.cells.void.where(played: false)
    played_cell = @board.cells.find_by @move
    neighbours(played_cell).each { |n| n.update(played: true) }
  end

  private

  def neighbours(cell)
    if cell&.not_mines_neighbours?
      @cells.each do |empty_cell|
        set_and_find empty_cell if not_included_and_neighbour cell, empty_cell
      end
    end
    @empties
  end

  def set_and_find(empty_cell)
    @empties << empty_cell
  end

  def not_included_and_neighbour(cell, empty_cell)
    neighbour?(cell, empty_cell) && !@empties.include?(empty_cell)
  end
end
