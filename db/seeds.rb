# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?

  users = []
  movies = []
  reviews = []
      
  # users << User.create(email: 'bob@bob.com', password: '123456', password_confirmation: '123456', firstname: 'Bob', lastname: 'Bob', admin: true)

  # 20.times do |i|
  #     users << User.create(
  #         firstname: Faker::Name.first_name,
  #         lastname: Faker::Name.last_name,
  #         email: Faker::Internet.email,
  #         password: "123456",
  #         password_confirmation: "123456"
  #     )
  # end


real_movies = [
  ['Solaris', 'Andrei Tarkovsky', 167, "A psychologist is sent to a station orbiting a distant planet in order to discover what has caused the crew to go insane.", Faker::Time.forward(365), (File.open(File.join(Rails.root, './db/seed_photos/movie_posters/solaris.jpg')))],
  ['Soy Cuba', 'Mikhail Kalazotov', 120, 'A movie about cuba', Faker::Time.forward(365), (File.open(File.join(Rails.root, './db/seed_photos/movie_posters/soy_cuba.jpg')))],
  ['Un chien andalou', 'Luis Bunuel', 16, "A surrealistic film with input from Salvador Dalí, director Luis Buñuel presents stark, surrealistic images that shock the viewers including the slitting open of a woman's eye and a dead horse being pulled along on top of a piano. Obviously open to interpretation - from deep meanings to it all meaning absolutely nothing - it is certain that this short (17 minutes) film presented something new in the cinema of its day.", Faker::Time.forward(365), (File.open(File.join(Rails.root, './db/seed_photos/movie_posters/unchienandalou.jpg'))) ],
  ['Happiness', 'Todd Solondz', 134, "When a young woman rejects her current overweight suitor in a restaurant, he unexpectedly places a curse on her. The film then moves on to her sisters. One is a happily married woman with a psychiatrist husband and three kids. Unfortunately the husband develops an unnatural fascination for his 11 year old son's male classmates, fantasizes about mass killing in a park, and masturbates to teen magazines. One of his patients has an unrequited fascination for the third sister. Meanwhile the apparently stable 40 year marriage of the sister's parents suddenly unravels when he decides he has had enough and wants to live a hermit's life in Florida. Obviously, the whole movie is slightly warped in its viewpoint and certainly presents abnormal relationships among all of its parties.",
  Faker::Time.forward(365), (File.open(File.join(Rails.root,'./db/seed_photos/movie_posters/happiness.jpg'))) ],
  ['Picnic at Hanging Rock', 'Peter Weir', 115, "The film relates the fictitious story of the disappearance of several schoolgirls and their teacher during a picnic to Hanging Rock on St. Valentine's Day in 1900, and the subsequent effect on the local community. Picnic at Hanging Rock was a commercial and critical success.", Faker::Time.forward(365), (File.open(File.join(Rails.root,'./db/seed_photos/movie_posters/picnic_at_hanging.jpg'))) ],
  ['7 Faces of Dr.Lao', 'George Pal', 100 , "A mysterious circus comes to a western town bearing wonders and characters that entertain the inhabitants and teach valuable lessons.", Faker::Time.forward(365), (File.open(File.join(Rails.root, './db/seed_photos/movie_posters/7.jpg')))],
  ['Boyz n the Hood', 'John Singleton', 112 , "Saga of a group of childhood friends growing up in a Los Angeles ghetto.", Faker::Time.forward(365), (File.open(File.join(Rails.root, './db/seed_photos/movie_posters/boyz.jpg')))],
  ['Nashville', 'Robert Altman', 159 , "Over the course of a few hectic days, numerous interrelated people prepare for a political convention as secrets and lies are surfaced and revealed.", Faker::Time.forward(365), (File.open(File.join(Rails.root, './db/seed_photos/movie_posters/nashville.jpg')))],
  ['The Lost Skeleton of Cadavra', 'Larry Blamire', 90 , "A bad scientist and wife, a mad scientist and skeleton, two aliens and their escaped pet are all searching for the elusive element \"atmospherium\".", Faker::Time.forward(365), (File.open(File.join(Rails.root, './db/seed_photos/movie_posters/lost.jpg')))],
  ['Panther Panchali', 'Satyajit Ray', 122 , "The story of a young boy, Apu, and life in his small Indian village. His parents are quite poor - his father Harihar, a writer and poet, gave away the family's fruit orchard to settle his brother's debts. His sister Durga and an old aunt also still lives with them. His mother Sarbojaya bears the brunt of the family's situation. She scrapes by and sells her personal possessions to put food on the table and has to bear the taunts of her neighbors as Durga is always stealing fruit from their orchard. Things get worse when Harihar disappears for five months and Durga falls ill. Even after Harihar returns, the family is left with few alternatives.", Faker::Time.forward(365), (File.open(File.join(Rails.root, './db/seed_photos/movie_posters/panther.jpg')))],
  ['I Even Met Happy Gypsies', 'Aleksandar Petrovic', 94 , "Bora the Gypsy is married to an older woman, and he falls in love with the younger Tissa, who is being offered in marriage by her father, to a young gypsy man. This marriage arrangement is according to custom. Tissa rejects her husband, claiming he is not able to consumate the marriage, and Bora joins her. They get a monk in the mountains to marry them. Unable to return to the Gypsy camp, Tissa tries to reach Belgrad on her own, but a couple of truck drivers rape her, and she does return in misery to her tribe. Meanwhile, Bora defends his honour the traditional way, in a knife duwl, and kills his opponent. Therefore he, too, must leave the tribe. And yet, we'll find happy gypsies...", Faker::Time.forward(365), (File.open(File.join(Rails.root, './db/seed_photos/movie_posters/gypsy.jpg')))],
  ['La Jetée', 'Chris Marker', 28 , "Time travel, still images, a past, present and future and the aftermath of World War III. The tale of a man, a slave, sent back and forth, in and out of time, to find a solution to the world's fate. To replenish its decreasing stocks of food, medicine and energies, and in doing so, resulting in a perpetual memory of a lone female, life, death and past events that are recreated on an airports jetée.", Faker::Time.forward(365), (File.open(File.join(Rails.root, './db/seed_photos/movie_posters/jetee.jpg')))],
  ['The Marriage of Maria Braun', 'Rainer Werner Fassbinder', 120, "A World War II widow seeks to adjust to life in postwar Germany.", Faker::Time.forward(365), (File.open(File.join(Rails.root, './db/seed_photos/movie_posters/marriage.jpg')))],
  ['Cinema Paradiso', 'Guiseppe Tornatore', 155 , "A filmmaker recalls his childhood, when he fell in love with the movies at his village's theater and formed a deep friendship with the theater's projectionist.", Faker::Time.forward(365), (File.open(File.join(Rails.root, './db/seed_photos/movie_posters/cinema.jpg')))],
  ['Touch of Evil', 'Orson Welles', 95 , "A stark, perverse story of murder, kidnapping, and police corruption in a Mexican border town.", Faker::Time.forward(365), (File.open(File.join(Rails.root, './db/seed_photos/movie_posters/touch.jpg')))],
  ['Le Beau Serge', 'Claude Chabrole', 98 , "Francois comes back to his home village in France after more than a decade. He notices that the village hasn't changed much, but the people have, especially his old friend Serge who has become a drunkard. Francois now tries to find out what happened to him and tries to help him.", Faker::Time.forward(365), (File.open(File.join(Rails.root, './db/seed_photos/movie_posters/beau.jpg')))]
]

fake_movies = [
  ['Oh Golly I Miss Uncle Petey', 'Mangrove Bush', 123, 'As a young plant, Petey conquers depression to rise to the top of the inter-office ping-pong league', Faker::Time.forward(365), (File.open(File.join(Rails.root,'./db/seed_photos/movie_posters/unclepetey.jpg'))) ],
  ['goldfishman takes everything you have', 'The Shedvotch Wwins', 111, "uhh, like stuff happens and you know, it all wraps up nicely.",
  Faker::Time.forward(365), (File.open(File.join(Rails.root,'./db/seed_photos/movie_posters/goldfish.jpg'))) ],
  ['benny Gets it on','The Shedvotch Wwins', 111, "uhh, like stuff happens and you know, it all wraps up nicely.",
  Faker::Time.forward(365), (File.open(File.join(Rails.root,'./db/seed_photos/movie_posters/benjamenfranklin.jpg'))) ]


]

real_movies.each do |movie|
  movies << Movie.create(
    title: movie[0],
    director: movie[1],
    runtime_in_minutes: movie[2],
    description: movie[3],
    release_date: movie[4],
    image: movie[5]
    )
end





  # 50.times do |i|
  #     movies << Movie.create(
  #       title: Faker::App.name,
  #       director: Faker::Name.name,
  #       runtime_in_minutes: rand(150),
  #       description: Faker::Lorem.paragraph,
  #       release_date: Faker::Time.forward(365),
        # remote_image_url: Faker::Avatar.image 
  #     )
  # end

  # 1000.times do |i|
  #     reviews << Review.create(
  #       text: Faker::Lorem.paragraph,
  #       rating_out_of_ten: rand(1..10),
  #       user: users.sample,
  #       movie: movies.sample
  #     )
  # end
end