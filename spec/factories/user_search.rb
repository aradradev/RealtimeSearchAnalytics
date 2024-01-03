FactoryBot.define do
  factory :user_search do
    query { 'Example query' }
    ip_address { '127.0.0.1' }
  end
end
