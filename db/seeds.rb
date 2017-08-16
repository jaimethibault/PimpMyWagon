puts "Destroying Bookings"
Booking.destroy_all
puts "Destroying PimpedCars"
PimpedCar.destroy_all
puts "Destroying Users"
User.destroy_all

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
urls = [
  "http://www.sub5zero.com/sites/default/files/uploads/2010/08/Turtle%20Power.jpg",
  "http://www.sub5zero.com/sites/default/files/uploads/2010/08/WTF%20Mobile.jpg",
  "http://www.sub5zero.com/sites/default/files/uploads/2010/08/Pimp%20Pacman.jpg",
  "http://www.sub5zero.com/sites/default/files/uploads/2010/08/Pokemon%20Beetle.jpg",
  "http://prod-cdn-history-co-uk.s3.amazonaws.com/s3fs-public/styles/landscape__desktop/public/pimped-out-celebrity-car_0.jpg?WKU9WyLWHLOdfrgdE0lNPzuf0S_cKKBP&timestamp=1494236040",
  "http://1.bp.blogspot.com/-R1PFc5MvqEg/VTWBIgBFkuI/AAAAAAAAABs/BTQaExi3XrQ/s1600/pimp%2Bmy%2Bride%2B%2B%2BGoogle%2BSearch.png",
  "http://www.sub5zero.com/sites/default/files/uploads/2010/08/McDonalds%20Mobie%3B.jpg",
  "http://www.sub5zero.com/sites/default/files/uploads/2010/08/Pimp%20Pacman.jpg",
  "http://www.sub5zero.com/sites/default/files/uploads/2010/08/The%20Crap%20Mobile.jpg",
  "http://prod-cdn-history-co-uk.s3.amazonaws.com/s3fs-public/styles/landscape__desktop/public/pimped-out-celebrity-car_0.jpg?WKU9WyLWHLOdfrgdE0lNPzuf0S_cKKBP&timestamp=1494236040",
  "https://sixprizes.com/wp-content/uploads/pikachu-car.jpg",
  "http://cdn.smosh.com/sites/default/files/legacy.images/smosh-pit/052011/donknuts-spongebob.jpg"
]
i = 0
10.times do
  pimped_car = PimpedCar.new(name: random_name.sample)
  pimped_car.description = Faker::Lorem.paragraph
  pimped_car.price_per_day = rand(50..100)
  pimped_car.user = User.all.sample
  # add a picture
  url = urls[i]
  i += 1
  pimped_car.save!
  pimped_car.photo_url = url
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
