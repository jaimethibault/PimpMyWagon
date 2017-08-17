puts "Destroying Bookings"
Booking.destroy_all
puts "Destroying Promos"
Promo.destroy_all
puts "Destroying PimpedCars"
PimpedCar.destroy_all
puts "Destroying Users"
User.destroy_all

puts "Creating Users"
i = 0
3.times do
  user = User.new
  user.email = Faker::Internet.email
  user.password = 'password'
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  urls = [
    "https://scontent-cdt1-1.xx.fbcdn.net/v/t1.0-1/c25.0.150.150/1622165_10152629789833079_1383118263_n.jpg?oh=5f54a89ac3f182ab5512a55cffb434fb&oe=5A34E9A4",
    "https://scontent-cdt1-1.xx.fbcdn.net/v/t1.0-1/c0.53.320.320/p320x320/31831_127280883952890_785031_n.jpg?oh=911201f6292f661157f48cc764d165f5&oe=5A31B029",
    "https://scontent-cdt1-1.xx.fbcdn.net/v/t1.0-1/p320x320/17757603_10154567963552817_4400652973366918292_n.jpg?oh=0e75a4524b04d3c45127dcfd18607611&oe=59EBFA1C"
  ]
  user.facebook_picture_url = urls[i]
  user.save!
  i += 1
end
puts "Users created"

puts "Creating Pimped Cars"
car_name = [
  "BMW M3 blue sport version",
  "Subaru Impreza White for one day",
  "Porsche Carrera old model vintage",
  "Lamborghini mat and orange yeah",
  "Rallye car Peugeot",
  "Orange show off Mustang",
  "Mercedes Yellox SUV oh my god",
  "Keke's 3 wheels motorcycle",
  "Green classy Ferrari",
  "Red classic Ferrari"
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

addresses = [
"20 Rue de Cléry, 75002 Paris",
"18 Rue Chappe, 75018 Paris",
"16 Villa Gaudelet, 75011 Paris",
"12 Rue Daguerre, 75014 Paris",
"112 Rue Oberkampf, 75011 Paris",
"122 Rue Vaugirard, 75015 Paris",
"25 rue quincampoix 75004 Paris",
"30 rue de Paradis, 75010 Paris",
"2 rue des Goncourt, 75011 Paris",
"44 rue d'Enghien, 75010 Paris"
]


i = 0
10.times do
  pimped_car = PimpedCar.new(name: car_name[i])
  pimped_car.description = Faker::Lorem.paragraph
  pimped_car.price_per_day = rand(50..100)
  pimped_car.user = User.all.sample
  # add a picture
  url = urls[i]
  address = addresses[i]
  pimped_car.address = address
  i += 1
  pimped_car.save!
  pimped_car.photo_url = url
end
puts "Pimped Cars created"

puts "Creating Bookings"
10.times do
  #todo, change to a random datetime
  d = rand(9..12)
  m = rand(1..31)
  ends_at = Date.new(2017,d,m)
  starts_at = ends_at-[1,2,3,4,5].sample
  status = "pending"
  pimped_car_id = PimpedCar.all.sample.id
  user_id = User.all.sample.id
  h = { starts_at: starts_at, ends_at: ends_at, status: status, pimped_car_id: pimped_car_id, user_id: user_id }
  Booking.create(h)
end
puts "Bookings created"

puts "Creating Promos"
10.times do
  #todo, change to a random datetime
  d = rand(9..10)
  m = rand(1..31)
  limit_offer_date = Date.new(2017,d,m)
  discount = [0.20,0.25,0.30,0.35,0.40].sample
  pimped_car_id = PimpedCar.all.sample.id
  h = { discount: discount, limit_offer_date: limit_offer_date, pimped_car_id: pimped_car_id,}
  Promo.create(h)
end
puts "Promos created"

