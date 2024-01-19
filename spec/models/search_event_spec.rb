require 'rails_helper'

RSpec.describe SearchEvent, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:query) }
    it { should validate_length_of(:query).is_at_least(1).is_at_most(255) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:company) }
  end

  describe 'factory' do
    it 'is valid' do
      search_event = FactoryBot.build(:search_event)
      expect(search_event).to be_valid
    end
  end
end
