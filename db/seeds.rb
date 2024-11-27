require "open-uri"

# Event.destroy_all

# events.each do |event|

# event = Event.create!(
#   date: DateTime.now + rand(1..15).days,
#   price: 69.0,
#   location: "Stade de France, 93200 Saint-Denis",
#   title: "Concert The Beatles",
#   description: "Un concert légendaire des Beatles au Stade de France, réunissant des milliers de fans dans une ambiance électrique, où les icônes britanniques font revivre leurs classiques intemporels sous un ciel étoilé."
# )

# file = URI.parse("https://img.nrj.fr/VKhMtOHrTXFyq-Kf6jODc-uDgYo=/medias%2F2019%2F02%2Fthe-beatles-picto-rs_5c77f18519960.jpg").open
# event.photo.attach(io: file, filename: "event_#{event.id}.png", content_type: "image/png")
# event.save!

# event = Event.create!(
#   date: DateTime.now + rand(1..15).days,
#   price: 26.90,
#   location: "Athena Art Café, 3 rue Claude Chahu Paris 75016",
#   title: "Café peinture",
#   description: "Un café peinture chaleureux où créativité et convivialité se rencontrent, invitant les participants à exprimer leur art tout en savourant une boisson réconfortante."
# )

# file = URI.parse("https://cdn.sortiraparis.com/images/80/62403/736808-drink-paint-un-afterwork-peinture-et-degustation-de-vin-en-compagnie-d-un-e-artiste-a-paris.jpg").open
# event.photo.attach(io: file, filename: "event_#{event.id}.png", content_type: "image/png")
# event.save!

# event = Event.create!(
#   date: DateTime.now + rand(1..15).days,
#   price: 9.90,
#   location: "59 rue des horizons, 75012 Paris",
#   title: "Cinéma sur les toits",
#   description: "Au programme : des classiques intemporels et des pépites du cinéma indépendant, accompagnés de pop-corn artisanal, de cocktails estivaux, et de la douce brise parisienne."
# )

# file = URI.parse("https://offloadmedia.feverup.com/parissecret.com/wp-content/uploads/2020/07/19141426/rooftop-cinema-edit-xlarge-1024x577.jpg").open
# event.photo.attach(io: file, filename: "event_#{event.id}.png", content_type: "image/png")
# event.save!

# event = Event.create!(
#   date: DateTime.now + rand(1..15).days,
#   price: 89.00,
#   location: "Boulevard du parc, 77700 Coupvray",
#   title: "Disneyland",
#   description: "Une journée magique à Disneyland Paris, où attractions, parades féeriques et rencontres avec les personnages emblématiques transportent petits et grands dans un rêve éveillé."
# )

# file = URI.parse("https://res.cloudinary.com/du5jifpgg/image/upload/t_opengraph_image/Parcours/itin%C3%A9raires/Disneyland-et-alentours/Fetes-de-fin-d-annee-2021-a-disneyland-paris-header.jpg").open
# event.photo.attach(io: file, filename: "event_#{event.id}.png", content_type: "image/png")
# event.save!

# event = Event.create!(
#   date: DateTime.now + rand(1..15).days,
#   price: 23.50,
#   location: "5 Quai Marcel Dassault - 92150 Suresnes",
#   title: "Brunch sur une péniche",
#   description: "Un brunch sur une péniche, mêlant délices gourmands et vue imprenable, où l’on savoure un repas raffiné tout en glissant paisiblement sur la Seine."
# )

# file = URI.parse("https://uploads.lebonbon.fr/source/2022/november/16172/img-3969-1-_1_2000.jpg").open
# event.photo.attach(io: file, filename: "event_#{event.id}.png", content_type: "image/png")
# event.save!

# event = Event.create!(
#   date: DateTime.now + rand(1..15).days,
#   price: 11.50,
#   location: "Grand Palais Immersif, 110, rue de Lyon, 75012 Paris",
#   title: "Exposition PIXELS de Miguel Chevalier",
#   description: "Le Grand Palais Immersif vous invite à découvrir PIXELS, la première grande exposition parisienne dédiée à Miguel Chevalier, pionnier de l’art numérique. Installée au cœur de la Bastille, cette exposition exceptionnelle, pensée sur deux étages et occupant plus de 1200 m², vous plongera dans un univers où réel et virtuel fusionnent pour repousser les frontières"
# )

# file = URI.parse("https://grandpalais-immersif.fr/sites/immersif/files/styles/w1920_extra_wide/public/2024-10/GPI_miguelchevalier_affiche_231024.jpg?itok=k7OqlfQc").open
# event.photo.attach(io: file, filename: "event_#{event.id}.png", content_type: "image/png")
# event.save!

# event = Event.create!(
#   date: DateTime.now + rand(1..15).days,
#   price: 0.0,
#   location: "Paris",
#   title: "Run dans Paris avec RunNation",
#   description: "Un footing dynamique avec l’appli de jeux de running Run Nation, où chaque kilomètre parcouru devient une aventure ludique, transformant les rues de Paris en un terrain de jeu interactif pour allier sport et fun."
# )

# file = URI.parse("https://www2.u-trail.com/wp-content/uploads/2022/01/footig.jpg").open
# event.photo.attach(io: file, filename: "event_#{event.id}.png", content_type: "image/png")
# event.save!

# event = Event.create!(
#   date: DateTime.now + rand(1..15).days,
#   price: 6.50,
#   location: "14 rue Crespin du gast, 75011 Paris",
#   title: "Concours de fléchettes",
#   description: "Un concours de fléchettes convivial à l’école Le Wagon, organisé entre deux cours de Ruby, où étudiants et passionnés se défient dans une ambiance festive et décontractée, alliant précision et bonne humeur."
# )

# file = URI.parse("https://upload.wikimedia.org/wikipedia/commons/f/fb/Darts_in_a_dartboard.jpg").open
# event.photo.attach(io: file, filename: "event_#{event.id}.png", content_type: "image/png")
# event.save!

# event = Event.create!(
#   date: DateTime.now + rand(1..15).days,
#   price: 19.90,
#   location: "Pl. de l'Opéra, 75009 Paris",
#   title: "Escape Game à l'Opéra garnier",
#   description: "Un escape game palpitant à l'Opéra Garnier, où les participants explorent les mystérieuses coulisses de ce monument emblématique, résolvant énigmes et secrets cachés entre ses murs majestueux."
# )

# file = URI.parse("https://www.dansesaveclaplume.com/wordpress/wp-content/uploads/inside-opera_home-ok.jpg").open
# event.photo.attach(io: file, filename: "event_#{event.id}.png", content_type: "image/png")
# event.save!


#   date: DateTime.now + rand(1..15).days,
#   price: 0.0,
#   location: "Paris",
#   title: "Regarder un film avec RealMates",
#   description: "Un événement unique où l'on se réunit pour une soirée cinéma inoubliable grâce à l’appli Reelmates, qui rend le choix du film aussi amusant que la projection elle-même, pour une expérience partagée et sans prise de tête, entre rires, découvertes et émotions."
# )

# file = URI.parse("https://cdn.paris.fr/qfapv4/2024/07/17/huge-363fb6687bad0dd437a521ac5ab7aace.png").open
# event.photo.attach(io: file, filename: "event_#{event.id}.png", content_type: "image/png")
# event.save!

#require “open-uri”
# Réinitialise tous les événements existants
Event.destroy_all
events_data = [
  {
    date: DateTime.now + rand(1..15).days,
    price: 69.0,
    location: "Stade de France, 93200 Saint-Denis",
    title: "Concert The Beatles",
    description: "Un concert légendaire des Beatles au Stade de France, réunissant des milliers de fans dans une ambiance électrique, où les icônes britanniques font revivre leurs classiques intemporels sous un ciel étoilé.",
    image_url: "https://img.nrj.fr/VKhMtOHrTXFyq-Kf6jODc-uDgYo=/medias%2F2019%2F02%2Fthe-beatles-picto-rs_5c77f18519960.jpg"
  },
  {
    date: DateTime.now + rand(1..15).days,
    price: 26.90,
    location: "Athena Art Café, 3 rue Claude Chahu Paris 75016",
    title: "Café peinture",
    description: "Un café peinture chaleureux où créativité et convivialité se rencontrent, invitant les participants à exprimer leur art tout en savourant une boisson réconfortante.",
    image_url: "https://cdn.sortiraparis.com/images/80/62403/736808-drink-paint-un-afterwork-peinture-et-degustation-de-vin-en-compagnie-d-un-e-artiste-a-paris.jpg"
  },
  {
    date: DateTime.now + rand(1..15).days,
    price: 9.90,
    location: "59 rue des horizons, 75012 Paris",
    title: "Cinéma sur les toits",
    description: "Au programme : des classiques intemporels et des pépites du cinéma indépendant, accompagnés de pop-corn artisanal, de cocktails estivaux, et de la douce brise parisienne.",
    image_url: "https://offloadmedia.feverup.com/parissecret.com/wp-content/uploads/2020/07/19141426/rooftop-cinema-edit-xlarge-1024x577.jpg"
  },
  {
    date: DateTime.now + rand(1..15).days,
    price: 89.00,
    location: "Boulevard du parc, 77700 Coupvray",
    title: "Disneyland",
    description: "Une journée magique à Disneyland Paris, où attractions, parades féeriques et rencontres avec les personnages emblématiques transportent petits et grands dans un rêve éveillé.",
    image_url: "https://res.cloudinary.com/du5jifpgg/image/upload/t_opengraph_image/Parcours/itin%C3%A9raires/Disneyland-et-alentours/Fetes-de-fin-d-annee-2021-a-disneyland-paris-header.jpg"
  },
  {
    date: DateTime.now + rand(1..15).days,
    price: 23.50,
    location: "5 Quai Marcel Dassault - 92150 Suresnes",
    title: "Brunch sur une péniche",
    description: "Un brunch sur une péniche, mêlant délices gourmands et vue imprenable, où l’on savoure un repas raffiné tout en glissant paisiblement sur la Seine.",
    image_url: "https://uploads.lebonbon.fr/source/2022/november/16172/img-3969-1-_1_2000.jpg"
  },
  {
      date: DateTime.now + rand(1..15).days,
      price: 11.50,
      location: "Grand Palais Immersif, 110, rue de Lyon, 75012 Paris",
      title: "Exposition PIXELS de Miguel Chevalier",
      description: "Le Grand Palais Immersif vous invite à découvrir PIXELS, la première grande exposition parisienne dédiée à Miguel Chevalier, pionnier de l’art numérique. Installée au cœur de la Bastille, cette exposition exceptionnelle, pensée sur deux étages et occupant plus de 1200 m², vous plongera dans un univers où réel et virtuel fusionnent pour repousser les frontières",
      image_url: "https://grandpalais-immersif.fr/sites/immersif/files/styles/w1920_extra_wide/public/2024-10/GPI_miguelchevalier_affiche_231024.jpg?itok=k7OqlfQc"
  },
  {
      date: DateTime.now + rand(1..15).days,
      price: 0.0,
      location: "Paris",
      title: "Run dans Paris avec RunNation",
      description: "Un footing dynamique avec l’appli de jeux de running Run Nation, où chaque kilomètre parcouru devient une aventure ludique, transformant les rues de Paris en un terrain de jeu interactif pour allier sport et fun.",
      image_url: "https://www2.u-trail.com/wp-content/uploads/2022/01/footig.jpg"
  },
  {
    date: DateTime.now + rand(1..15).days,
    price: 6.50,
    location: "14 rue Crespin du gast, 75011 Paris",
    title: "Concours de fléchettes",
    description: "Un concours de fléchettes convivial à l’école Le Wagon, organisé entre deux cours de Ruby, où étudiants et passionnés se défient dans une ambiance festive et décontractée, alliant précision et bonne humeur.",
    image_url: "https://upload.wikimedia.org/wikipedia/commons/f/fb/Darts_in_a_dartboard.jpg"
  },
  {
      date: DateTime.now + rand(1..15).days,
      price: 19.90,
      location: "Pl. de l'Opéra, 75009 Paris",
      title: "Escape Game à l'Opéra garnier",
      description: "Un escape game palpitant à l'Opéra Garnier, où les participants explorent les mystérieuses coulisses de ce monument emblématique, résolvant énigmes et secrets cachés entre ses murs majestueux.",
      image_url: "https://www.dansesaveclaplume.com/wordpress/wp-content/uploads/inside-opera_home-ok.jpg"
  },
  {
      date: DateTime.now + rand(1..15).days,
      price: 0.0,
      location: "Paris",
      title: "Regarder un film avec RealMates",
      description: "Un événement unique où l'on se réunit pour une soirée cinéma inoubliable grâce à l’appli Reelmates, qui rend le choix du film aussi amusant que la projection elle-même, pour une expérience partagée et sans prise de tête, entre rires, découvertes et émotions.",
      image_url: "https://cdn.paris.fr/qfapv4/2024/07/17/huge-363fb6687bad0dd437a521ac5ab7aace.png"   # event.photo.attach(io: file, filename: "event_#{event.id}.png", content_type: "image/png"  # event.save!
  },
]
events_data.each do |event_data|
    # Crée l’événement
    event = Event.create!(
      date: event_data[:date],
      price: event_data[:price],
      location: event_data[:location],
      title: event_data[:title],
      description: event_data[:description]
    )
    # Télécharge et attache l’image
    file = URI.open(event_data[:image_url])
    event.photo.attach(io: file, filename: "event_#{event.id}.png", content_type: "image/png")
end
puts "Seed terminée avec succès"

puts "Deleting old users..."
User.destroy_all
puts "Creating users..."

users = [
  {
    name: "Ethan 🇺🇸",
    email: 'test1@test.test',
    password: '123456',
    age: 23,
    avatar_url: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1732704994/scale-9_sb7sms.png",
    language: ["Anglais", "Français"].join(' '),
    mood: "Skincare avec des amis",
    vacation: "Montagne",
    life_choice: "Famille"
  },
  {
    name: "Inès 🇲🇦",
    email: 'test2@test.test',
    password: '123456',
    age: 30,
    avatar_url: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1732704994/scale-8_bc3u1h.png",
    language: ["Arabe", "Français", "Anglais"].join(' '),
    mood: "Skincare avec des amis",
    vacation: "Montagne",
    life_choice: "Famille"
  },

  {
    name: "Lucas 🇫🇷",
    email: 'test3@test.test',
    password: '123456',
    age: 33,
    avatar_url: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1732704993/scale-1_tghfv0.png",
    language: ["Français"].join(' '),
    mood: "Skincare avec des amis",
    vacation: "Montagne",
    life_choice: "Famille"
  },
  {
    name: "Sophia 🇮🇹",
    email: 'test4@test.test',
    password: '123456',
    age: 30,
    avatar_url: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1732705731/scale-10_ehgcud.png",
    language: ["Italien", "Anglais"].join(' '),
    mood: "Skincare avec des amis",
    vacation: "Montagne",
    life_choice: "Famille"
  },
  {
    name: "Amir",
    email: 'test5@test.test',
    password: '123456',
    age: 28,
    avatar_url: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1732704993/scale-6_s1bjnv.png",
    language: ["Hindi", "Anglais", "Français"].join(' '),
    mood: "Skincare avec des amis",
    vacation: "Montagne",
    life_choice: "Famille"
  },
  {
    name: "Chloé",
    email: 'test6@test.test',
    password: '123456',
    age: 24,
    avatar_url: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1732705729/scale-11_panyul.png",
    language: ["Français", "Espagnol"].join(' '),
    mood: "Skincare avec des amis",
    vacation: "Montagne",
    life_choice: "Famille"
  },
  {
    name: "Mateo",
    email: 'test7@test.test',
    password: '123456',
    age: 29,
    avatar_url: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1732704993/scale-2_vtnc6t.png",
    language: ["Espagnol", "Français"].join(' '),
    mood: "Skincare avec des amis",
    vacation: "Montagne",
    life_choice: "Famille"
  },
  {
    name: "Yuki",
    email: 'test8@test.test',
    password: '123456',
    age: 31,
    avatar_url: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1732704994/scale-8_bc3u1h.png",
    language: ["Japonais", "Anglais"].join(' '),
    mood: "Skincare avec des amis",
    vacation: "Montagne",
    life_choice: "Famille"
  },
  {
    name: "Lara",
    email: 'test9@test.test',
    password: '123456',
    age: 25,
    avatar_url: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1732704994/scale-9_sb7sms.png",
    language: ["Français", "Allemand", "Anglais"].join(' '),
    mood: "Skincare avec des amis",
    vacation: "Montagne",
    life_choice: "Famille"
  }
]

begin
  users.each do |user|
    new_user = User.new(user)
    if new_user.save
      puts "User #{new_user.name} created successfully!"
    else
      puts "Failed to create user: #{new_user.errors.full_messages}"
    end
  end
rescue ActiveSupport::MessageEncryptor::InvalidMessage => e
  puts "Encryption error: #{e.message}"
rescue StandardError => e
  puts "An error occurred: #{e.message}"
end
puts "Users successfully created!"
