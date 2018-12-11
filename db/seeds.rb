# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

puts 'cleaning database'
Searched.destroy_all
Sale.destroy_all
Order.destroy_all
Productimage.destroy_all
Product.destroy_all
Producttype.destroy_all
User.destroy_all


puts 'creating users'
user1 = User.create!(email: 'salah@gmail.com', password: '123456',username: 'salah', fistname: 'salah', lastname: 'jar' )
user2 = User.create!(email: 'amine@gmail.com', password: '123456',username: 'amine', fistname: 'amine', lastname: 'salim' )

puts 'creating Product Types'
cat1 = Producttype.create!(name: "Clothing", description: "Jeans, Hoodies, T-shirt, ...", thumb: '<i class="fas fa-tshirt"></i>', user: user1 )
cat2 = Producttype.create!(name: "Cellphones & Accessories", description: "Samsung, Iphone, Casque ...", thumb: '<i class="fas fa-mobile-alt"></i>', user: user1 )
cat3 = Producttype.create!(name: "Computer", description: "Dell, HP, MacBook Pro,...", thumb: '<i class="fas fa-laptop"></i>', user: user1 )
cat4 = Producttype.create!(name: "Consumer_Electronics", description: "Casque, Bluetooth...", thumb: '<i class="fas fa-bolt"></i>', user: user1 )

cat5 = Producttype.create!(name: "Bages", description: ",...", thumb: '<i class="fas fa-tv"></i>', user: user1 )
cat6 = Producttype.create!(name: "Shoes", description: "...", thumb: '<i class="fas fa-shoe-prints"></i>', user: user1 )
cat7 = Producttype.create!(name: "Automobiles & Accessories", description: "TV, Phone,...", thumb: '<i class="fas fa-car"></i>', user: user1 )
cat8 = Producttype.create!(name: "Home & Garden", description: "TV, Phone,...", thumb: '<i class="fas fa-home"></i>', user: user1 )

puts 'creating products'
  p1 = Product.create!(name: "Samsung", description:  "Samsung A5 2018 bonne qualité", producttype: cat2, price_cents: 100000, user: user1 )

  pimage1 = Productimage.new(product: p1, user: user1)
  pimage1.remote_photo_url = 'db/seed_images/phone/galaxy.jpg'
  pimage1.save!
puts 'Product 1 created'

  p2 = Product.create!(name: "Iphone", description:  "IPHONE 8_gallery 2017", producttype: cat2, price_cents: 500000, user: user1 )

  pimage2 = Productimage.new(product: p2, user: user1)
  pimage2.remote_photo_url = 'db/seed_images/phone/iphone8.jpeg'
  pimage2.save!
puts 'Product 2 created'

p3 = Product.create!(name: "Jacket", description:  "2018's Best Ski Jackets", producttype: cat1, price_cents: 15000, user: user1 )

  pimage3 = Productimage.new(product: p3, user: user1)
  pimage3.remote_photo_url = 'db/seed_images/clothing/Jacket.jpg'
  pimage3.save!
puts 'Product 3 created'

p4 = Product.create!(name: "Jeans", description:  "Jeans bleu for woman", producttype: cat1, price_cents: 20000, user: user1 )

  pimage4 = Productimage.new(product: p4, user: user1)
  pimage4.remote_photo_url = 'db/seed_images/clothing/Jeans.jpg'
  pimage4.save!
puts 'Product 4 created'

p5 = Product.create!(name: "Dresses", description:  "Night Out Dresses ", producttype: cat1, price_cents: 130000, user: user1 )

  pimage5 = Productimage.new(product: p5, user: user1)
  pimage5.remote_photo_url = 'db/seed_images/clothing/dresses.jpg'
  pimage5.save!
puts 'Product 5 created'

p6 = Product.create!(name: "T-shirt", description:  "T-shirt black for man", producttype: cat1, price_cents: 16000, user: user1 )

  pimage6 = Productimage.new(product: p6, user: user1)
  pimage6.remote_photo_url = 'db/seed_images/clothing/tshirt.png'
  pimage6.save!
puts 'Product 6 created'


p7 = Product.create!(name: "MacBook", description:  "Macbookair 2018 prevu ", producttype: cat3, price_cents: 1200000, user: user1 )

  pimage7 = Productimage.new(product: p7, user: user1)
  pimage7.remote_photo_url = 'db/seed_images/computer/macbook.jpg'
  pimage7.save!
puts 'Product 7 created'

p8 = Product.create!(name: "Dell", description:  "dell xps 13 2018", producttype: cat3, price_cents: 900000, user: user1 )

  pimage8 = Productimage.new(product: p8, user: user1)
  pimage8.remote_photo_url = 'db/seed_images/computer/dell.jpg'
  pimage8.save!
puts 'Product 8 created'

p9 = Product.create!(name: "Casque", description:  "jumeaux Casque sans-fil Bluetooth écouteur des écouteurs ", producttype: cat4, price_cents: 30000, user: user1 )

  pimage9 = Productimage.new(product: p9, user: user1)
  pimage9.remote_photo_url = 'db/seed_images/electronics/casque.jpg'
  pimage9.save!
puts 'Product 9 created'

p10 = Product.create!(name: "Casque", description:  "Casque avec fil", producttype: cat4, price_cents: 15000, user: user1 )

  pimage10 = Productimage.new(product: p10, user: user1)
  pimage10.remote_photo_url = 'db/seed_images/electronics/casque2.jpg'
  pimage10.save!
puts 'Product 10 created'


puts "finished!"




