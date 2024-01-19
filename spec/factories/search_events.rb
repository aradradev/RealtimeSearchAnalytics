# spec/factories/search_events.rb
FactoryBot.define do
  factory :search_event do
    sequence(:query) { |n| "Search Query #{n}" }
    association :user
    association :company
  end
end
