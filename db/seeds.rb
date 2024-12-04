require "open-uri"

Event.destroy_all
Like.destroy_all
Match.destroy_all

events_data = [
  {
    date: DateTime.now + rand(1..15).days,
    price: 69.0,
    location: "Stade de France, 93200 Saint-Denis",
    title: "Concert The Beatles",
    description: "Un concert légendaire des Beatles au Stade de France, réunissant des milliers de fans.",
    image_url: "https://www.radiofrance.fr/s3/cruiser-production-eu3/2017/09/aba5ee37-f87f-469b-b8a7-8135934fa366/640x340_beatles_gettyimages-89724270.jpg"
  },
  {
    date: DateTime.now + rand(1..15).days,
    price: 26.90,
    location: "Athena Art Café, 3 rue Claude Chahu Paris 75016",
    title: "Café peinture",
    description: "Un café peinture chaleureux où créativité et convivialité se rencontrent.",
    image_url: "https://cdn.sortiraparis.com/images/80/62403/736808-drink-paint-un-afterwork-peinture-et-degustation-de-vin-en-compagnie-d-un-e-artiste-a-paris.jpg"
  },
  {
    date: DateTime.now + rand(1..15).days,
    price: 9.90,
    location: "59 rue des horizons, 75012 Paris",
    title: "Cinéma sur les toits",
    description: "Au programme : des classiques intemporels et des pépites du cinéma indépendant.",
    image_url: "https://offloadmedia.feverup.com/parissecret.com/wp-content/uploads/2020/07/19141426/rooftop-cinema-edit-xlarge-1024x577.jpg"
  },
  {
    date: DateTime.now + rand(1..15).days,
    price: 89.00,
    location: "Boulevard du parc, 77700 Coupvray",
    title: "Disneyland",
    description: "Une journée magique à Disneyland Paris, où attractions et parades féeriques deviennent réalité.",
    image_url: "https://res.cloudinary.com/du5jifpgg/image/upload/t_opengraph_image/Parcours/itin%C3%A9raires/Disneyland-et-alentours/Fetes-de-fin-d-annee-2021-a-disneyland-paris-header.jpg"
  },
  {
    date: DateTime.now + rand(1..15).days,
    price: 23.50,
    location: "5 Quai Marcel Dassault - 92150 Suresnes",
    title: "Brunch sur une péniche",
    description: "Un brunch sur une péniche, mêlant délices gourmands et vue imprenable.",
    image_url: "https://uploads.lebonbon.fr/source/2022/november/16172/img-3969-1-_1_2000.jpg"
  },
  {
      date: DateTime.now + rand(1..15).days,
      price: 11.50,
      location: "Grand Palais Immersif, 110, rue de Lyon, 75012 Paris",
      title: "Exposition PIXELS de Miguel Chevalier",
      description: "La première grande exposition parisienne dédiée à l’art numérique.",
      image_url: "https://grandpalais-immersif.fr/sites/immersif/files/styles/w1920_extra_wide/public/2024-10/GPI_miguelchevalier_affiche_231024.jpg?itok=k7OqlfQc"
  },
  {
      date: DateTime.now + rand(1..15).days,
      price: 5.0,
      location: "Paris",
      title: "Run dans Paris avec RunNation",
      description: "Un footing dynamique avec l’appli de jeux de running Run Nation.",
      image_url: "https://www2.u-trail.com/wp-content/uploads/2022/01/footig.jpg"
  },
  {
    date: DateTime.now + rand(1..15).days,
    price: 6.50,
    location: "14 rue Crespin du gast, 75011 Paris",
    title: "Concours de fléchettes",
    description: "Un concours de fléchettes convivial à l’école Le Wagon.",
    image_url: "https://upload.wikimedia.org/wikipedia/commons/f/fb/Darts_in_a_dartboard.jpg"
  },
  {
      date: DateTime.now + rand(1..15).days,
      price: 19.90,
      location: "Pl. de l'Opéra, 75009 Paris",
      title: "Escape Game à l'Opéra garnier",
      description: "Un escape game palpitant où les participants explorent les mystérieuses coulisses de ce monument emblématique.",
      image_url: "https://www.dansesaveclaplume.com/wordpress/wp-content/uploads/inside-opera_home-ok.jpg"
  },
  {
      date: DateTime.now + rand(1..15).days,
      price: 5.0,
      location: "Paris",
      title: "Regarder un film avec RealMates",
      description: "Une soirée cinéma inoubliable grâce à l’appli Reelmates.",
      image_url: "https://resize.programme-television.org/original/var/premiere/storage/images/news/streaming/prime-video/comment-regarder-des-films-et-des-series-en-streaming-gratuitement-4717889/101960816-1-fre-FR/Comment-regarder-des-films-et-des-series-en-streaming-gratuitement.jpg"   # event.photo.attach(io: file, filename: "event_#{event.id}.png", content_type: "image/png"  # event.save!
  },
]
events_data.each do |event_data|
    # Crée l’événement
    event = Event.create!(
      date: event_data[:date],
      price: event_data[:price],
      location: event_data[:location],
      title: event_data[:title],
      description: event_data[:description],
      image_url: event_data[:image_url]
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
    name: "Rousselot 🇺🇸",
    email: 'test1@test.test',
    password: '123456',
    age: 23,
    avatar_url: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1733134724/IMG_6150_jojyqa.png",
    language: ["Anglais", "Français"].join(' '),
    mood: "party_night",
    vacation: "forêt",
    life_choice: "travail",
    friends_age: 20,
    friends_distance: 50
  },
  # {
  #   name: "Inès",
  #   email: 'test2@test.test',
  #   password: '123456',
  #   age: 25,
  #   avatar_url: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1732704994/scale-8_bc3u1h.png",
  #   language: ["Arabe", "Français", "Anglais"].join(' '),
  #   mood: "museum",
  #   vacation: "plage",
  #   life_choice: "amour",
  #   friends_age: 20,
  #   friends_distance: 50
  # },
  {
    name: "Ilan 🇫🇷",
    email: 'test3@test.test',
    password: '123456',
    age: 33,
    avatar_url: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1733134864/IMG_6192_z2ww0o.png",
    language: ["Français"].join(' '),
    mood: "drink",
    vacation: "city",
    life_choice: "famille",
    friends_age: 20,
    friends_distance: 50
  },
  # {
  #   name: "Sophia 🇮🇹",
  #   email: 'test4@test.test',
  #   password: '123456',
  #   age: 30,
  #   avatar_url: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1732705731/scale-10_ehgcud.png",
  #   language: ["Italien", "Anglais"].join(' '),
  #   mood: "cosy",
  #   vacation: "plage",
  #   life_choice: "travail",
  #   friends_age: 20,
  #   friends_distance: 50
  # },
  {
    name: "Pierre",
    email: 'test5@test.test',
    password: '123456',
    age: 28,
    avatar_url: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1733134862/IMG_6201_puog02.png",
    language: ["Hindi", "Anglais", "Français"].join(' '),
    mood: "party_night",
    vacation: "montagne",
    life_choice: "argent",
    friends_age: 20,
    friends_distance: 50
  },
  {
    name: "Elisa",
    email: 'test6@test.test',
    password: '123456',
    age: 24,
    avatar_url: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1733134856/IMG_6186_p5yli6.png",
    language: ["Français", "Espagnol"].join(' '),
    mood: "drink",
    vacation: "city",
    life_choice: "famille",
    friends_age: 20,
    friends_distance: 50
  },
  {
    name: "Paul",
    email: 'test7@test.test',
    password: '123456',
    age: 29,
    avatar_url: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1733134861/IMG_6196_nccxha.png",
    language: ["Espagnol", "Français"].join(' '),
    mood: "cosy",
    vacation: "forêt",
    life_choice: "amour",
    friends_age: 20,
    friends_distance: 50
  },
  {
    name: "Baudouin",
    email: 'test8@test.test',
    password: '123456',
    age: 31,
    avatar_url: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1733134859/IMG_6181_gx02i8.png",
    language: ["Japonais", "Anglais"].join(' '),
    mood: "museum",
    vacation: "city",
    life_choice: "travail",
    friends_age: 20,
    friends_distance: 50
  },
  {
    name: "Milena",
    email: 'test9@test.test',
    password: '123456',
    age: 25,
    avatar_url: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1733134866/IMG_6203_w0geku.png",
    language: ["Français", "Allemand", "Anglais"].join(' '),
    mood: "party_night",
    vacation: "plage",
    life_choice: "argent",
    friends_age: 20,
    friends_distance: 50
  },
  {
    name: "Antoine 🇪🇸",
    email: "sofia@test.test",
    password: "123abc",
    age: 24,
    avatar_url: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1733134857/IMG_6176_nqgivt.png",
    language: ["Espagnol", "Anglais"].join(' '),
    mood: "cosy",
    vacation: "plage",
    life_choice: "famille",
    friends_age: 22,
    friends_distance: 20
  },
  {
    name: "Paul 🇩🇪",
    email: "noah@test.test",
    password: "securepass",
    age: 27,
    avatar_url: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1733134854/IMG_6173_ketgik.png",
    language: ["Allemand", "Anglais"].join(' '),
    mood: "party_night",
    vacation: "forêt",
    life_choice: "argent",
    friends_age: 25,
    friends_distance: 35
  },
  # {
  #   name: "Olivia 🇨🇦",
  #   email: "olivia@test.test",
  #   password: "mypassword",
  #   age: 28,
  #   avatar_url: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1733134856/IMG_6186_p5yli6.png",
  #   language: ["Français", "Anglais"].join(' '),
  #   mood: "museum",
  #   vacation: "lac",
  #   life_choice: "travail",
  #   friends_age: 27,
  #   friends_distance: 50
  # },
  {
    name: "Santiana 🇮🇹",
    email: "mia@test.test",
    password: "pass123",
    age: 29,
    avatar_url: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1733134751/IMG_6178_kgc0m3.png",
    language: ["Italien", "Français"].join(' '),
    mood: "drink",
    vacation: "plage",
    life_choice: "amour",
    friends_age: 28,
    friends_distance: 45
  },
  {
    name: "Micka 🇧🇷",
    email: "benjamin@test.test",
    password: "letmein",
    age: 25,
    avatar_url: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1733134726/IMG_6195_ekteow.png",
    language: ["Portugais", "Espagnol"].join(' '),
    mood: "party_night",
    vacation: "city",
    life_choice: "travail",
    friends_age: 23,
    friends_distance: 50
  },
  {
    name: "Emilie 🇲🇦",
    email: "ali@test.test",
    password: "desert2024",
    age: 31,
    avatar_url: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1733134725/IMG_6171_qplnyp.png",
    language: ["Arabe", "Français"].join(' '),
    mood: "cosy",
    vacation: "montagne",
    life_choice: "famille",
    friends_age: 30,
    friends_distance: 50
  }
  # },
  # {
  #   name: "Tatiana",
  #   email: "tatiana@test.test",
  #   password: "russia2024",
  #   age: ,
  #   avatar_url: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1733134864/IMG_6192_z2ww0o.png",
  #   language: ["Colombienne", "Anglais"].join(' '),
  #   mood: "museum",
  #   vacation: "forêt",
  #   life_choice: "argent",
  #   friends_age: 28,
  #   friends_distance: 40
  # }
]

flashcards = {
  mood: {
    cosy: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1732723362/flashcard_mood_jrkyzo.jpg",
    drink: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1732723114/flashcard_mood_bar_warrp5.jpg",
    party_night: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1732723114/flashcard_mood_fete_lesxj8.jpg",
    museum: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1732723114/flashcard_mood_musee_fkcqae.jpg"
  },
  vacation: {
    montagne: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1732723116/flashcard_vacances_montagne_hc31lz.jpg",
    plage: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1732723116/flashcard_vacances_mer_snd8ic.jpg",
    city: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1732723116/flashcard_vacances_ville_hup7qb.jpg",
    forêt: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1732723115/flashcard_vacances_foret_yff6lv.jpg"
  },
  life_choice: {
    famille: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1732723113/flashcard_interest_famille_blhbzy.jpg",
    amour: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1732723093/flashcard_interest_amour_fyguqm.jpg",
    argent: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1732723113/flashcard_interest_money_optozh.jpg",
    travail: "https://res.cloudinary.com/dxhdcwxy0/image/upload/v1732723114/flashcard_interest_pro_2_afeocc.jpg"
  }
}

begin
  users.each do |user|
    new_user = User.new(user.except(:avatar_url))
    file = URI.parse(user[:avatar_url]).open
    new_user.avatar.attach(io: file, filename: "#{new_user.name}.png", content_type: "image/png")

    # gestion de mood, vacation, livechoice
    # checker les keys correspondantes et attach la photo qui match avec
    mood_image = flashcards[:mood][new_user.mood.to_sym]
    file = URI.parse(mood_image).open
    new_user.mood_image.attach(io: file, filename: "mood.png", content_type: "image/png")

    vacation_image = flashcards[:vacation][new_user.vacation.to_sym]
    file = URI.parse(vacation_image).open
    new_user.vacation_image.attach(io: file, filename: "vacation.png", content_type: "image/png")

    life_image = flashcards[:life_choice][new_user.life_choice.to_sym]
    file = URI.parse(life_image).open
    new_user.life_image.attach(io: file, filename: "life_choice.png", content_type: "image/png")

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
