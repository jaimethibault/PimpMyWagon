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
  "http://foreignaffairsmotorsports.com/wp-content/uploads/2016/11/awe-tuning.jpg",
  "http://www.motiveempire.com/wp-content/uploads/2015/07/MG_3218.jpg",
  "https://s-media-cache-ak0.pinimg.com/originals/73/06/d3/7306d34409687811be144aa2bb9c71e8.jpg",
  "http://www.toubiz.mu/uploads/homepagecms/21495307225.jpg",
  "http://www.idgraphique.fr/asset/tmp/slide/decoration-voiture-sport-lettrage-597.jpg",
  "http://roush.mustangmotorsport.com.au/images/roush/slideshow/slide_r350t_orange.jpg",
  "http://www.aspire-design.co.uk/wp-content/uploads/2014/12/Aspire-Design-Giovanni-Wheels-image-08-Large.jpg",
  "http://www.covingtonscustoms.com/Pics/TopBanner/05.jpg",
  "http://modena-motorsport.de/wp-content/uploads/layerslider/FullWidth-Modena-Motorsport-Home-I/Modena-Motorsport-4.jpg",
  "http://modena-motorsport.de/wp-content/uploads/2016/12/Modena-Motorsport-16.jpg",
  "http://www.motiveempire.com/wp-content/uploads/2015/07/MG_3163.jpg",
  "http://www.motiveempire.com/wp-content/uploads/2015/04/MG_5125.jpg"
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
