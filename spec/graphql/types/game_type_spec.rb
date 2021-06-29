# frozen_string_literal: true

# spec/graphql/types/game_type_spec.rb

RSpec.describe Types::GameType do
  set_graphql_type

  it 'has an :id field of ID type' do
    # Ensure that the field id is of type ID
    expect(subject.fields['id'].type.to_type_signature).to eq('ID!')
  end

  it 'has a :player field of String type' do
    # Ensure the field is of String type
    expect(subject.fields['player'].type.to_type_signature).to eq('String!')
  end

  it 'has a :board field of BoardType type' do
    # Ensure the field is of BoardType type
    expect(subject.fields['board'].type.to_type_signature).to eq('Board!')
  end
end
