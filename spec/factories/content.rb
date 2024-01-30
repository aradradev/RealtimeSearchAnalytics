FactoryBot.define do
    factory :content do
        title { Faker::Lorem.words(number: 3).join(' ')[0, 20] }
        body { Faker::Lorem.paragraph }
    end
end