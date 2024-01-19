require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'associations' do
    it { should have_many(:users) }
    it { should have_many(:search_events).through(:users) }
  end

  describe 'factory' do
    it 'is valid' do
      company = FactoryBot.build(:company)
      expect(company).to be_valid
    end
  end
end
