# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# ユーザーを作成
User.create!(name: "Example User", email: "example@example.org")
99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@example.org"
    User.create!(name: name, email: email)
end

# コミュニティを作成
10.times do
    community = Community.create!(keywords: Faker::Lorem.words(number: 10))
    
    community.users << User.order("RANDOM()").limit(3) # ユーザーをコミュニティに追加

    puts "Community created with ID: #{community.id} and keywords: #{community.keywords.inspect}"

    10.times do
        user = community.users.sample
        
        if user.present?
            message = Message.create!(content: Faker::Lorem.sentence(word_count: 10), community: community, user: user)
            
            if message.persisted?
                puts "Message created for community #{community.id} by user #{user.id}."
            else
                puts "Message could not be created: #{message.errors.full_messages.join(", ")}"
            end
        else
            puts "User does not exist for community #{community.id}."
        end
    end
end


# 論文を作成
20.times do
    paper = Paper.create!( # ここでpaperを定義
        title: Faker::Book.title,
        url: Faker::Internet.url        
    )

    authors = User.order("RANDOM()").limit(3)
    authors.each do |author|
        UserPaper.create!(user: author, paper: paper) # 正しい変数名を使用
    end
end
