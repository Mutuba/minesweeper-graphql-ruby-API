# frozen_string_literal: true

class Play < ApplicationRecord
  belongs_to :game
  validates_presence_of :x, :y
end
