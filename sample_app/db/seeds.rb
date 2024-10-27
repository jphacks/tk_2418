# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(name: "Example User",
email: "example@example.org")
99.times do |n|
    name = Faker::Name:name
    email = "example-#(n+1)@example.org"
    User.create!(name: name,
    email: email)
end
10.times do
    community = Community.create!(
        keywords: Faker::Lorem.words(number: 10)
    )
    community.users << User.order("RANDOM()").limit(3)
    10.times do
        community.message.create!(
        user: community.users.sample,
        content: Faker::Lorem.sentence(word_count: 10)
        )
    end
end
20.times do
    Paper.create!(
        title: Faker::Book.title,
        url: Faker::Internet.url        
    )
    authors = User.order("RANDOM()").limit(3)
    authors.each do |author|
        UserPaper.create!(user: author,paper: paper)
    end
end