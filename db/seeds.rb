# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  user = User.new
  user.email = Faker::Internet.email
  user.password = 'password'
  user.save!
end
random_name = ["Peugeot 206 blue sport version", "My tunning car can be yours for one day", "I am tunning", "Great tunning car", "Rent my car for a great afternoon", "My car is simply the best tunning car in the world", "I am american and I love Tunning", "Do you love tunning car ? Do you ?", "Tunning is life and you should know it", "Life without tunning isn't living"]

10.times do
  pimped_car = PimpedCar.new(name: random_name.sample)
  pimped_car.description = Faker::Lorem.paragraph
  pimped_car.price_per_day = rand(50..100)
  pimped_car.user = User.all.sample
  pimped_car.save!
end
