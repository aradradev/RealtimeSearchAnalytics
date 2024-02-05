5.times do
    Content.create(
        title: Faker::Lorem.words(number: 3).join(' ')[0, 20],
        body: Faker::Lorem.paragraph
    )
end

10.times do
    Search.create(
        query: Faker::Lorem.words(number: 3).join(' '),
        ip_address: Faker::Internet.ip_v4_address
    )
end

puts "Database seeded successfully."
