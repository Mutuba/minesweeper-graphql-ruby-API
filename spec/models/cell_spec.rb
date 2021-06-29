# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cell, type: :model do
  it { should validate_presence_of(:x) }
  it { should validate_presence_of(:y) }
  it { should validate_presence_of(:kind) }
  it { should belong_to(:board) }

  it {
    should define_enum_for(:kind)
      .with(
        mine: 1,
        void: 0
      )
  }
end
