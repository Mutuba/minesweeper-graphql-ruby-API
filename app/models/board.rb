# frozen_string_literal: true

class Board < ApplicationRecord
  DEFAULT_COLS = 10
  DEFAULT_ROWS = 10
  DEFAULT_MINES_PERCENTAGE = 10

  has_many :cells, dependent: :destroy
  belongs_to :game

  validates_presence_of :rows, :cols, :mines_percentage

  after_initialize :set_defaults

  private

  def set_defaults
    if new_record?
      self.cols ||= DEFAULT_COLS
      self.rows ||= DEFAULT_ROWS
      self.mines_percentage ||= DEFAULT_MINES_PERCENTAGE
    end
  end
end
