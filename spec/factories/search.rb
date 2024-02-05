FactoryBot.define do
  factory :search do
    query { Faker::Lorem.words(number: 3).join(' ') }
    ip_address { Faker::Internet.ip_v4_address[0, 13] }
  end
end
