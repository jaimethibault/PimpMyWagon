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
users = [
  "jackie@michel.com",
  "michel@jackie.com",
  "micheline@jackie.com"
]
first_names = [
  "Jackie",
  "Michel",
  "Micheline"
]
3.times do
  user = User.new
  user.email = users[i]
  user.password = 'password'
  user.first_name = first_names[i]
  user.last_name = Faker::Name.last_name
  urls = [
    "https://scontent-cdt1-1.xx.fbcdn.net/v/t1.0-9/10997490_907097779334969_1284262528561985815_n.jpg?oh=c3afa5c308ce7405d109656dda4ffd50&oe=5A2F762F",
    "https://scontent-cdt1-1.xx.fbcdn.net/v/t1.0-9/20799136_274376209715766_7099253975910970765_n.jpg?oh=e84997278e80801d94f81ca917120c19&oe=5A1A935E",
    "https://scontent-cdt1-1.xx.fbcdn.net/v/t1.0-9/19875558_10155671439642176_1610883172945385131_n.jpg?oh=482cbb47e3786e5c1c813330c294645e&oe=5A16D6B7"
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
  "Red classic Ferrari",
  "Green Cadillac",
  "Seat Ibiza grey classy",
  "Black Corbillard",
  "Purple Butterfly doors incognito",
  "World Grand Prix 95 ecars",
  "Mat Black Plymouth"
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
  "http://www.liftabrand.com/portals/0/slide.jpg",
  "http://www.motiveempire.com/wp-content/uploads/2015/04/MG_5125.jpg",
  "http://www.pimpbuilder.com/wp-content/uploads/2015/09/Car-4.jpg",
  "http://goddesspromotionstt.com/wp-content/uploads/2014/05/Pimp-My-Ride-Car.jpg",
  "https://s-media-cache-ak0.pinimg.com/originals/0f/b3/69/0fb369aa22b1e2fe1ba10a16de23d25a.jpg",
  "https://s-media-cache-ak0.pinimg.com/originals/53/11/04/531104de90852edd5708e20b2915c357.jpg"
]

addresses = [
"20 Rue de Cléry, 75002 Paris",
"242 Rue de l'Alma, 59100 Roubaix",
"Chemin des Postes, 62220 Carvin",
"La Plaine Saint-Denis, Saint-Denis",
"112 Rue Oberkampf, 75011 Paris",
"Rue Alain Colas, 80136 Rivery",
"Avenue Montaigne, 60000 Beauvais",
"Zac de Mercières n°3, 8 Rue du Fonds Pernant, 60200 Compiègne",
"Avenue François Mitterrand, 95300 Pontoise",
"Voie Communale ZAC du Mont Renaud, 60400 Noyon",
"74 Rue du Général Leclerc, 60210 Grandvilliers",
"150 Boulevard de Strasbourg, 94130 Nogent-sur-Marne",
"166-170 Boulevard Robert Ballanger, 93420 Villepinte",
"1 Avenue Paul Langevin, 95200 Sarcelles",
"240 Chaussée Watt, 59200 Tourcoing",
"58 Avenue Winston Churchill, 62000 Arras"
]


i = 0
16.times do
  pimped_car = PimpedCar.new(name: car_name[i])
  pimped_car.description = Faker::Lorem.paragraph
  pimped_car.price_per_day = rand(50..100)
  pimped_car.user = User.all.sample
  # add a picture
  url = urls[i]
  address = addresses[i]
  pimped_car.address = address
  i += 1
  pimped_car.photo_url = url
  pimped_car.save!
end
puts "Pimped Cars created"

puts "Creating Bookings"
16.times do
  #todo, change to a random datetime
  m = rand(9..12)
  d = rand(1..31)
  ends_at = Date.new(2017,m,d)
  starts_at = ends_at-[1,2,3,4,5].sample
  status = "pending"
  pimped_car_id = PimpedCar.all.sample.id
  user_id = User.all.sample.id
  h = { starts_at: starts_at, ends_at: ends_at, status: status, pimped_car_id: pimped_car_id, user_id: user_id }
  Booking.create(h)
end
puts "Bookings created"

puts "Creating Promos"
16.times do
  #todo, change to a random datetime
  m = rand(9..10)
  d = rand(1..31)
  limit_offer_date = Date.new(2017,m,d)
  discount = [0.20,0.25,0.30,0.35,0.40].sample
  pimped_car_id = PimpedCar.all.sample.id
  h = { discount: discount, limit_offer_date: limit_offer_date, pimped_car_id: pimped_car_id,}
  Promo.create(h)
end
puts "Promos created"

