puts "Creating Users"
10.times do
  user = User.new
  user.email = Faker::Internet.email
  user.password = 'password'
  user.save!
end
puts "Users created"

puts "Creating Pimped Cars"
random_name = [
  "Peugeot 206 blue sport version",
  "My tunning car can be yours for one day",
  "I am tunning",
  "Great tunning car",
  "Rent my car for a great afternoon",
  "My car is simply the best tunning car in the world",
  "I am american and I love Tunning",
  "Do you love tunning car ? Do you ?",
  "Tunning is life and you should know it",
  "Life without tunning isn't living"
]
10.times do
  pimped_car = PimpedCar.new(name: random_name.sample)
  pimped_car.description = Faker::Lorem.paragraph
  pimped_car.price_per_day = rand(50..100)
  pimped_car.user = User.all.sample
  pimped_car.save!
end
puts "Pimped Cars created"

puts "Creating Bookings"
10.times do
  #todo, change to a random datetime
  ends_at = Date.new(2017,9,3)
  starts_at = ends_at-[1,2,3,4,5].sample
  status = "pending"
  pimped_car_id = PimpedCar.all.sample.id
  user_id = User.all.sample.id
  h = { starts_at: starts_at, ends_at: ends_at, status: status, pimped_car_id: pimped_car_id, user_id: user_id }
  Booking.create(h)
end
puts "Bookings created"
