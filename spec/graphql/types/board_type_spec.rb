# frozen_string_literal: true

# spec/graphql/types/board_type_spec.rb

RSpec.describe Types::BoardType do
  set_graphql_type

  it 'has an :id field of ID type' do
    # Ensure that the field id is of type ID
    expect(subject.fields['id'].type.to_type_signature).to eq('ID!')
  end

  it 'has a :cols field of Integer type' do
    # Ensure the field is of Integer type
    expect(subject.fields['rows'].type.to_type_signature).to eq('Int!')
  end

  it 'has a :cols field of Integer type' do
    # Ensure the field is of Integer type
    expect(subject.fields['cols'].type.to_type_signature).to eq('Int!')
  end

  it 'has a :mines_percentage field of Integer type' do

    # Ensure the field is of Integer type
    expect(subject.fields['minesPercentage'].type.to_type_signature).to eq('Int!')
  end
end
