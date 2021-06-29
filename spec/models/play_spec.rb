# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Play, type: :model do
  it { should validate_presence_of(:x) }
  it { should validate_presence_of(:y) }

  it { should belong_to(:game) }
end
