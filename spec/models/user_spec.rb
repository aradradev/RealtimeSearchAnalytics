require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }

    let!(:existing_user) { create(:user) }
    it 'validates uniqueness of email scoped to company_id' do
      should validate_uniqueness_of(:email).scoped_to(:company_id).case_insensitive
    end
  end

  describe 'associations' do
    it { should belong_to(:company) }
    it { should have_many(:search_events) }
  end

  describe 'factory' do
    it 'is valid' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end
  end
end
