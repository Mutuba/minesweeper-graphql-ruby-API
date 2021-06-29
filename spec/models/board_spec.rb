# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Board, type: :model do
  it { should validate_presence_of(:rows) }
  it { should validate_presence_of(:cols) }
  it { should validate_presence_of(:mines_percentage) }

  it { should have_many(:cells).dependent(:destroy) }

  it { should belong_to(:game) }
end
