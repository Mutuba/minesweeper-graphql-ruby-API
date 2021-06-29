# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Game, type: :model do
  it { should validate_presence_of(:board) }

  it { should allow_value(false).for(:won) }

  it { should allow_value(false).for(:over) }

  it { should accept_nested_attributes_for(:board) }
end
