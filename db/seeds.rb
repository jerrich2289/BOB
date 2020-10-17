puts "Deleting all the old stuff..."
Message.destroy_all
Trade.destroy_all
Item.destroy_all
User.destroy_all

puts "Adding users..."
user1 = User.create!(name: "Lise", email: "lise@email.com", password: "password", address: "Oslo, Norway")
user1.photo.attach(io: File.open("app/assets/images/seed/lise.jpg"),filename: "lise.jpg")
user2 = User.create!(name: "Ingrid", email: "ingrid@email.com", password: 'password', address: "Oslo, Norway")
user2.photo.attach(io: File.open("app/assets/images/seed/ing.jpg"),filename: "ing.jpg")
user3 = User.create!(name: "Martin", email: "martin@email.com",  password: "password", address: "Oslo, Norway")
user3.photo.attach(io: File.open("app/assets/images/seed/martin.png"),filename: "martin.png")
user4 = User.create!(name: "Jeremy", email: "jeremy@email.com", password: "password", address: "Oslo, Norway")
user4.photo.attach(io: File.open("app/assets/images/seed/jeremy.jpg"),filename: "jeremy.jpg")
user5 = User.create!(name: "Marshall", email: "Marshall@email.com", password: "password", address: "Oslo, Norway")
user5.photo.attach(io: File.open("app/assets/images/seed/marshall.jpg"),filename: "marshall.jpg")

puts "Adding items..."
item1 = Item.new(name: "Bowl", description: "Well taken care of glass bowl", size: "2", owner: user1,)
item1.photos.attach(io: File.open("app/assets/images/seed/Bowl-a.jpg"),filename: "bowl-a.jpg")
item1.photos.attach(io: File.open("app/assets/images/seed/Bowl-b.jpg"),filename: "bowl-b.jpg")
item1.save!

item2 = Item.new(name: 'Olympus Camera', description: 'Old 35mm Camera', size: '2', owner: user2)
item2.photos.attach(io: File.open("app/assets/images/seed/Camera-a.jpg"),filename: "camera-a.jpg")
item2.photos.attach(io: File.open("app/assets/images/seed/Camera-b.jpg"),filename: "camera-b.jpg")
item2.save!

item3 = Item.new(name: "Chair", description: "Great Chair", size: "3", owner: user3)
item3.photos.attach(io: File.open("app/assets/images/seed/Chair-a.jpg"),filename: "chair-a.jpg")
item3.photos.attach(io: File.open("app/assets/images/seed/Chair-b.jpg"),filename: "chair-b.jpg")
item3.save!

item4 = Item.new(name: "iPod", description: "Old iPod", size: "2", owner: user4)
item4.photos.attach(io: File.open("app/assets/images/seed/ipod.jpg"),filename: "ipod.jpg")
item4.photos.attach(io: File.open("app/assets/images/seed/ipod-b.jpg"),filename: "ipod-b.jpg")
item4.save!

item5 = Item.new(name: "Lawn Mower", description: "Big Lawn Mower", size: "4", owner: user5)
item5.photos.attach(io: File.open("app/assets/images/seed/lawn-a.jpg"),filename: "lawn.jpg")
item5.photos.attach(io: File.open("app/assets/images/seed/lawn-b.jpg"),filename: "lawn-b.jpg")
item5.save!

item6 = Item.new(name: "Lamp", description: "Older Lamp", size: "3", owner: user5)
item6.photos.attach(io: File.open("app/assets/images/seed/light-a.jpg"),filename: "light-a.jpg")
item6.photos.attach(io: File.open("app/assets/images/seed/light-b.jpg"),filename: "light-b.jpg")
item6.save!

item7 = Item.new(name: "Cooking Pan", description: "Cooking Pan", size: "2", owner: user3)
item7.photos.attach(io: File.open("app/assets/images/seed/Pan.jpg"),filename: "pan.jpg")
item7.save!

puts "Adding trades..."
trade1 =Trade.create!(item_1: item1, item_2: item2)
trade2 = Trade.create!(item_1: item3, item_2: item4)

puts "Adding messages..."
Message.create!(message: 'Hello... I would love to swap items!', trade:trade1, user: user1)
Message.create!(message: 'Would you like to trade?', trade: trade1, user: user2)
Message.create!(message: 'Lets Trade', trade:trade2, user: user3)
Message.create!(message: 'Hey, lets set up a time to make the trade', trade:trade2, user: user4)

puts "Done!"
