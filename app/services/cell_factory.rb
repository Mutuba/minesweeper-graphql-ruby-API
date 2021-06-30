# frozen_string_literal: true

class CellFactory
  include Neighbour

  def initialize(board:, move:)
    @board = board
    @move = move
  end

  def make
    @board.cols.times do |x|
      @board.rows.times do |y|
        mine = mines.include?({ x: x, y: y })
        attrs = mine ? { x: x, y: y, kind: :mine } : { x: x, y: y, kind: :void }
        attrs[:mines_neighbors] = calculate_neighbours attrs
        @board.cells << Cell.new(attrs)
      end
    end
  end

  private

  def mines
    @mines ||= calculate_mines
  end

  def calculate_mines
    mines_array = []
    repeated = true
    mines_number.times do
      mine = { x: rand(@board.cols), y: rand(@board.rows) }
      repeated = mines_array.include?(mine) || first_move_mine?(mine) while repeated
      mines_array << mine
    end
    mines_array
  end

  def first_move_mine?(mine)
    @move == mine
  end

  def calculate_neighbours(cell)
    return 0 if cell[:mine]

    mines.select { |mine| neighbour? cell, mine }.length
  end

  def mines_number
    @mines_number ||= cells_number * @board.mines_percentage / 100
  end

  def cells_number
    @cells_number ||= @board.rows * @board.cols
  end
end
