# frozen_string_literal: true

class PlayVerifier
  def initialize(game:, move:)
    @game = game
    @move = move
  end

  def move
    play && cell_played!
  end

  def playable?
    !cell.played?
  end

  def cell?
    cell.present?
  end

  def playable_with_neighbour_mine?
    cell&.not_mines_neighbours? && playable?
  end

  def won?
    @game.board.cells.where(played: false, kind: :void).blank?
  end

  def over?
    won? || cell.mine?
  end

  def play
    @play ||= @game.plays.find_or_create_by! @move
  end

  private

  def cell
    @cell ||= @game.board.cells.find_by! @move
  end

  def cell_played!
    cell.update! played: true
  end
end
