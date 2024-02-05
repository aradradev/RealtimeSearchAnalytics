# spec/models/search_spec.rb
require 'rails_helper'

RSpec.describe Search, type: :model do
    context 'validations' do
        it 'is valid with valid attributes' do
            search = build(:search)
            expect(search).to be_valid
        end

        it 'is invalid without a query' do
            search = build(:search, query: nil)
            expect(search).not_to be_valid
        end

        it 'is invalid without an IP address' do
            search = build(:search, ip_address: nil)
            expect(search).not_to be_valid
        end

        it 'is invalid with a query longer than 255 characters' do
            search = build(:search, query: "a" * 256)
            expect(search).not_to be_valid
        end

        it 'is invalid with an IP address longer than 13 characters' do
            search = build(:search, ip_address: '127.0.0.0.1.1.1')
            expect(search).not_to be_valid
        end
    end

    context 'search scope' do
        it 'returns results for a valid query' do
            create(:search, query: 'search term')
            results = Search.search('search term')
            expect(results.count).to eq(1)
        end

        it 'returns results for a valid IP address' do
            create(:search, ip_address: '192.168.1.1')
            results = Search.search('192.168.1.1')
            expect(results.count).to eq(1)
        end
    end
    
end