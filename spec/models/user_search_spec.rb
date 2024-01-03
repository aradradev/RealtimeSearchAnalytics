require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe UserSearch, type: :model do
  it { should validate_presence_of(:query) }
  it { should validate_uniqueness_of(:query) }

  it 'is valid with valid attributes' do
    user_search = build(:user_search)
    expect(user_search).to be_valid
  end

  it 'is not valid without a query' do
    user_search = build(:user_search, query: nil)
    expect(user_search).not_to be_valid
  end

  it 'is not valid without a unique query' do
    create(:user_search, query: 'unique_query')
    user_search = build(:user_search, query: 'unique_query')
    expect(user_search).not_to be_valid
  end

  it 'has a unique query scope' do
    create(:user_search, query: 'unique_query_1')
    create(:user_search, query: 'unique_query_2')
    unique_queries = UserSearch.unique_queries.map(&:query)
    expect(unique_queries).to contain_exactly('unique_query_1', 'unique_query_2')
  end

  it 'has timestamps' do
    user_search = create(:user_search)
    expect(user_search.created_at).to be_present
    expect(user_search.updated_at).to be_present
  end
end
