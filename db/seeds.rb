# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Message.destroy_all
Trade.destroy_all
Item.destroy_all
User.destroy_all
user1 = User.create!(name: "Bigger10", email: "chickenbreastssss@test.com", password: "password")
user2 = User.create!(name: "Better8", email: "email@email.com", password: 'password')
user3 = User.create!(name: "Swapsy22", email: "swapsy@test.com", password: "password")
user4 = User.create!(name: "Jazz", email: "jazz@email.com", password: "password")

item1 = Item.create!(name: "chair", description: "I am an average chair", size: "3", owner: user1)
item2 = Item.create!(name: 'broken window', description: 'Somewone ran into me', size: '4', owner: user2)
item3 = Item.create!(name: "hair brush", description: "I am over used but muched loved", size: "1", owner: user3)
item4 = Item.create!(name: 'lamp shade', description: 'I prefer to be worn as a hat', size: '2', owner: user4)

trade1 =Trade.create!(item_1: item1, item_2: item2)
trade2 = Trade.create!(item_1: item3, item_2: item4)


Message.create!(message: 'hey man, I am really keen to pick up my broken window', trade:trade1, user: user1)
Message.create!(message: 'Ill see you at midnight', trade: trade2, user: user2)
Message.create!(message: 'I dont think I want to give up my item. Sorry', trade:trade1, user: user3)
Message.create!(message: 'Hey, Lets set up a time to make the trade', trade:trade2, user: user4)


