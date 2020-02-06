# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
City.destroy_all
Tag.destroy_all
JoinTag.destroy_all
Gossip.destroy_all

10.times do
  City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

10.times do
  User.create(first_name:Faker::Name.first_name  , last_name: Faker::Name.last_name , description: Faker::Quote.famous_last_words , email: Faker::Internet.email, age: 31, city_id: Faker::Number.within(range: City.first.id..City.last.id))
end

20.times do
  Gossip.create(title: Faker::Lorem.word, content:Faker::Lorem.sentence, user_id: Faker::Number.within(range: User.first.id..User.last.id))
end

5.times do
  Tag.create(title: Faker::Lorem.word )
end

15.times do
  JoinTag.create(tag_id: Faker::Number.within(range: Tag.first.id..Tag.last.id), gossip_id: Faker::Number.within(range: Gossip.first.id..Gossip.last.id))
end

10.times do
  PrivateMessage.new(content: "yolo", recipient_id: Faker::Number.within(range: User.first.id..User.last.id), sender_id: User.last.id)
end