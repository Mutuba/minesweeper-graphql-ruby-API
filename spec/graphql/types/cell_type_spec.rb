# frozen_string_literal: true

# spec/graphql/types/game_type_spec.rb

RSpec.describe Types::CellType do
  set_graphql_type

  it 'has an :id field of ID type' do
    # Ensure that the field id is of type ID
    expect(subject).to have_field(:id).that_returns('ID!')
  end

  it 'has a :x field of Integer type' do
    # Ensure the field is of Integer type
    expect(subject).to have_field(:x).that_returns('Int!')
  end

  it 'has a :y field of Integer type' do
    # Ensure the field is of Integer type
    expect(subject).to have_field(:y).that_returns('Int!')
  end

  it 'has a :played field of Boolean type' do
    # Ensure the field is of Boolean type
    expect(subject.fields['played'].type.to_type_signature).to eq('Boolean!')
  end
end
