# frozen_string_literal: true

module Neighbour
  def neighbour?(cell, mine)
    is_between?(cell[:x], mine[:x]) && is_between?(cell[:y], mine[:y])
  end

  def is_between?(cell_position, mine_position)
    cell_position + 1 == mine_position ||
      cell_position - 1 == mine_position
  end
end
