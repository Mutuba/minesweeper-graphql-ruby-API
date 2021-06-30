# frozen_string_literal: true

RSpec.describe Types::QueryType do
  # avail type definer in our tests
  set_graphql_type

  # create fake games lists using the game factory
  let!(:games) { create_list(:game, 3) }

  describe 'querying all games lists' do
    it 'has a :games that returns a GameType type' do
      expect(subject).to have_field(:fetchAllGames).that_returns('[Game!]!')
    end

    # it 'returns all our created game lists' do
    # query_result = subject.fields["fetchAllGames"].resolve(nil, nil, nil)
    # ensure that each of our todo lists is returned
    #   todo_lists.each do |list|
    #     expect(query_result.to_a).to include(list)
    #   end

    #   # we can also check that the number of lists returned is the one we created.
    #   expect(query_result.count).to eq(todo_lists.count)
    # end
  end

  # describe 'querying a specific todo_list using it\'s id' do
  #   it 'returns the queried todo list' do
  #     # set the id of list1 as the ID
  #     id = todo_lists.first.id
  #     args = { id: id }
  #     query_result = subject.fields['todo_list'].resolve(nil, args, nil)

  #     # we should only get the first todo list from the db.
  #     expect(query_result).to eq(todo_lists.first)
  #   end
  # end
end
