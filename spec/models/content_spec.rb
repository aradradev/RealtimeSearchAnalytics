# spec/models/content_spec.rb
require 'rails_helper'

RSpec.describe Content, type: :model do
  context 'validations' do
    it 'is valid with valid attributes' do
      content = build(:content)
      expect(content).to be_valid
    end

    it 'is invalid without a title' do
        content = build(:content, title: nil)
        expect(content).not_to be_valid
    end

    it 'is invalid without a body' do
        content = build(:content, body: nil)
        expect(content).not_to be_valid 
    end

    it 'is valid when title is less than max char' do
        content = build(:content, title: 'a' * 10)
        expect(content).to be_valid
    end

    it 'is invalid when title is greater than max char' do
        content = build(:content, title: 'a' * 50)
        expect(content).not_to be_valid 
    end

    it 'is invalid when body is max length' do
        content = build(:content, body: Faker::Lorem.paragraph * 255)
        expect(content).not_to be_valid 
    end
  end
end
