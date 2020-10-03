# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Deleting all the old stuff..."
Message.destroy_all
Trade.destroy_all
Item.destroy_all
User.destroy_all

puts "Adding users..."
<<<<<<< HEAD
user1 = User.create!(name: "Bigger10", email: "chickenbreastssss@test.com", password: "password", address: "Oslo, Norway")
user2 = User.create!(name: "Better8", email: "email@email.com", password: 'password', address: "Oslo, Norway")
user3 = User.create!(name: "Swapsy22", email: "swapsy@test.com",  password: "password", address: "Oslo, Norway")
user4 = User.create!(name: "Jazz", email: "jazz@email.com", password: "password", address: "Oslo, Norway")
user4.photo.attach(io: File.open("app/assets/images/Jazz.jpg"),filename: "Jazz.jpg")

=======
user1 = User.create!(name: "Steve", email: "steve@email.com", password: "password", address: "Ski, Norway")
user1.photo.attach(io: File.open("app/assets/images/steve.jpg"),filename: "steve.jpg")
user2 = User.create!(name: "Bill", email: "bill@email.com", password: 'password', address: "Bergen, Norway")
user2.photo.attach(io: File.open("app/assets/images/bill.png"),filename: "bill.png")
user3 = User.create!(name: "Karin", email: "karin@email.com",  password: "password", address: "Oslo, Norway")
user3.photo.attach(io: File.open("app/assets/images/karin.png"),filename: "karin.png")
user4 = User.create!(name: "Jazz", email: "jazz@email.com", password: "password", address: "Låkehavna, Norway")
user4.photo.attach(io: File.open("app/assets/images/jazz.jpg"),filename: "jazz.jpg")
>>>>>>> master
puts "Adding items..."
item1 = Item.new(name: "chair", description: "I am an average chair", size: "3", owner: user1,)
item1.photos.attach(io: File.open("app/assets/images/preloved_restaurant_used_chairs_for_sale_1546660931_0035e8a60.jpeg"),filename: "preloved_restaurant_used_chairs_for_sale_1546660931_0035e8a60.jpeg")
item1.save!

item2 = Item.new(name: 'broken window', description: 'Somewone ran into me', size: '4', owner: user2)
item2.photos.attach(io: File.open("app/assets/images/broken-window-79750272-adobe.jpeg"),filename: "broken-window-79750272-adobe.jpeg")
item2.save!

item3 = Item.new(name: "hair brush", description: "I am over used but muched loved", size: "1", owner: user3)
item3.photos.attach(io: File.open("app/assets/images/girl-hairbrush-used-isolated-white-background-36490657.jpg"),filename: "girl-hairbrush-used-isolated-white-background-36490657.jpg")
item3.save!

item4 = Item.new(name: 'lamp shade', description: 'I prefer to be worn as a hat', size: '2', owner: user4)
item4.photos.attach(io: File.open("app/assets/images/Lampshade.jpg"),filename: "Lampshade.jpg")
item4.save!

item5 = Item.new(name: 'My Dirty sex ridden bed', description: 'Well loved, very well loved.', size: '5', owner: user1)
item5.photos.attach(io: File.open("app/assets/images/bed-mattress.jpg"),filename: "bed-mattress.jpg")
item5.save!

item6 = Item.new(name: 'Floral chair', description: 'Sit on my face please!', size: '3', owner: user2)
item6.photos.attach(io: File.open("app/assets/images/chair2.jpg"),filename: "chair2.jpg")
item6.save!

item7 = Item.new(name: 'an above average coffee table', description: 'let me hold your mug', size: '4', owner: user3)
item7.photos.attach(io: File.open("app/assets/images/coffee-table.jpg"),filename: "coffee-table.jpg")
item7.save!

item8 = Item.new(name: 'old picture frames', description: '', size: '1', owner: user4)
item8.photos.attach(io: File.open("app/assets/images/picture-frame.jpg"),filename: "picture-frame.jpg")
item8.save!

item7 = Item.new(name: 'Desk', description: 'for study', size: '5', owner: user3)
item7.photos.attach(io: File.open("app/assets/images/desk.jpg"),filename: "desk.jpg")
item7.save!

item8 = Item.new(name: 'plant', description: '', size: '2', owner: user1)
item8.photos.attach(io: File.open("app/assets/images/Plant.jpg"),filename: "Plant.jpg")
item8.save!

puts "Adding trades..."
trade1 =Trade.create!(item_1: item1, item_2: item2)
trade2 = Trade.create!(item_1: item3, item_2: item4)

puts "Adding messages..."
Message.create!(message: 'hey man, I am really keen to pick up my broken window', trade:trade1, user: user1)
Message.create!(message: 'Ill see you at midnight', trade: trade1, user: user2)
Message.create!(message: 'I dont think I want to give up my item. Sorry', trade:trade2, user: user3)
Message.create!(message: 'Hey, Lets set up a time to make the trade', trade:trade2, user: user4)

puts "Done!"
