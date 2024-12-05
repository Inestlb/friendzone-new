require "open-uri"

Event.all.each do |event|
  event.photo.purge if event.photo.attached?
end
Event.destroy_all
Like.destroy_all
Match.destroy_all

events_data = [
  {
    date: DateTime.now + rand(1..15).days,
    price: 69.0,
    location: "Stade de France, 93200 Saint-Denis",
    title: "The Beatles Concert",
    description: "A legendary Beatles concert at the Stade de France, bringing together thousands of fans.",
    image_url: "https://www.radiofrance.fr/s3/cruiser-production-eu3/2017/09/aba5ee37-f87f-469b-b8a7-8135934fa366/640x340_beatles_gettyimages-89724270.jpg"
  },
  {
    date: DateTime.now + rand(1..15).days,
    price: 26.90,
    location: "Athena Art Café, 3 rue Claude Chahu Paris 75016",
    title: "Painting Café",
    description: "A cozy painting café where creativity and friendliness come together.",
    image_url: "https://cdn.sortiraparis.com/images/80/62403/736808-drink-paint-un-afterwork-peinture-et-degustation-de-vin-en-compagnie-d-un-e-artiste-a-paris.jpg"
  },
  {
    date: DateTime.now + rand(1..15).days,
    price: 9.90,
    location: "59 rue des Horizons, 75012 Paris",
    title: "Cinema on the Rooftops",
    description: "On the agenda: timeless classics and gems of independent cinema.",
    image_url: "https://offloadmedia.feverup.com/parissecret.com/wp-content/uploads/2020/07/19141426/rooftop-cinema-edit-xlarge-1024x577.jpg"
  },
  {
    date: DateTime.now + rand(1..15).days,
    price: 89.00,
    location: "Boulevard du Parc, 77700 Coupvray",
    title: "Disneyland",
    description: "A magical day at Disneyland Paris, where attractions and fairy-tale parades come to life.",
    image_url: "https://res.cloudinary.com/du5jifpgg/image/upload/t_opengraph_image/Parcours/itin%C3%A9raires/Disneyland-et-alentours/Fetes-de-fin-d-annee-2021-a-disneyland-paris-header.jpg"
  },
  {
    date: DateTime.now + rand(1..15).days,
    price: 23.50,
    location: "5 Quai Marcel Dassault - 92150 Suresnes",
    title: "Brunch on a Boat",
    description: "A brunch on a boat, blending gourmet delights and breathtaking views.",
    image_url: "https://uploads.lebonbon.fr/source/2022/november/16172/img-3969-1-_1_2000.jpg"
  },
  {
    date: DateTime.now + rand(1..15).days,
    price: 11.50,
    location: "Grand Palais Immersif, 110, rue de Lyon, 75012 Paris",
    title: "PIXELS Exhibition by Miguel Chevalier",
    description: "The first major Parisian exhibition dedicated to digital art.",
    image_url: "https://grandpalais-immersif.fr/sites/immersif/files/styles/w1920_extra_wide/public/2024-10/GPI_miguelchevalier_affiche_231024.jpg?itok=k7OqlfQc"
  },
  {
    date: DateTime.now + rand(1..15).days,
    price: 5.0,
    location: "Paris",
    title: "Run in Paris with RunNation",
    description: "A dynamic jogging session with the Run Nation running game app.",
    image_url: "https://www2.u-trail.com/wp-content/uploads/2022/01/footig.jpg"
  },
  {
    date: DateTime.now + rand(1..15).days,
    price: 6.50,
    location: "14 rue Crespin du Gast, 75011 Paris",
    title: "Darts Tournament",
    description: "A friendly darts tournament at Le Wagon School.",
    image_url: "https://upload.wikimedia.org/wikipedia/commons/f/fb/Darts_in_a_dartboard.jpg"
  },
  {
    date: DateTime.now + rand(1..15).days,
    price: 19.90,
    location: "Pl. de l'Opéra, 75009 Paris",
    title: "Escape Game at the Opera Garnier",
    description: "An exciting escape game where participants explore the mysterious backstage of this iconic monument.",
    image_url: "https://www.dansesaveclaplume.com/wordpress/wp-content/uploads/inside-opera_home-ok.jpg"
  },
  {
    date: DateTime.now + rand(1..15).days,
    price: 5.0,
    location: "Paris",
    title: "Watch a Movie with RealMates",
    description: "An unforgettable movie night thanks to the ReelMates app.",
    image_url: "https://resize.programme-television.org/original/var/premiere/storage/images/news/streaming/prime-video/comment-regarder-des-films-et-des-series-en-streaming-gratuitement-4717889/101960816-1-fre-FR/Comment-regarder-des-films-et-des-series-en-streaming-gratuitement.jpg"
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

User.all.each do |user|
  user.avatar.purge if user.avatar.attached?
end
puts "Deleting old users..."
User.destroy_all
puts "Creating users..."

users = [
  {
    name: "Rousselot",
    email: 'test1@test.test',
    password: '123456',
    age: 23,
    avatar_url: "rousselot.jpg",
    language: ["English", "French"].join(' '),
    mood: "party_night",
    vacation: "foret",
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
    name: "Ilan",
    email: 'test3@test.test',
    password: '123456',
    age: 33,
    avatar_url: "ilan.jpg",
    language: ["French"].join(' '),
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
    avatar_url: "pierre.jpg",
    language: ["Hindi", "English", "French"].join(' '),
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
    avatar_url: "elisa.jpg",
    language: ["French", "Spanish"].join(' '),
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
    avatar_url: "paul.jpg",
    language: ["Spanish", "French"].join(' '),
    mood: "cosy",
    vacation: "foret",
    life_choice: "amour",
    friends_age: 20,
    friends_distance: 50
  },
  {
    name: "Baudouin",
    email: 'test8@test.test',
    password: '123456',
    age: 31,
    avatar_url: "baudouin.jpg",
    language: ["Japanese", "English"].join(' '),
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
    avatar_url: "milena.jpg",
    language: ["French", "German", "English"].join(' '),
    mood: "party_night",
    vacation: "plage",
    life_choice: "argent",
    friends_age: 20,
    friends_distance: 50
  },
  {
    name: "Antoine",
    email: "sofia@test.test",
    password: "123abc",
    age: 24,
    avatar_url: "antoine.jpg",
    language: ["Spanish", "English"].join(' '),
    mood: "cosy",
    vacation: "plage",
    life_choice: "famille",
    friends_age: 22,
    friends_distance: 20
  },
  {
    name: "Paul",
    email: "noah@test.test",
    password: "securepass",
    age: 27,
    avatar_url: "pauul.jpg",
    language: ["German", "English"].join(' '),
    mood: "party_night",
    vacation: "foret",
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
    name: "Santiana",
    email: "mia@test.test",
    password: "pass123",
    age: 29,
    avatar_url: "santiana.jpg",
    language: ["Italian", "French"].join(' '),
    mood: "drink",
    vacation: "plage",
    life_choice: "amour",
    friends_age: 28,
    friends_distance: 45
  },
  {
    name: "Micka",
    email: "benjamin@test.test",
    password: "letmein",
    age: 25,
    avatar_url: "micka.jpg",
    language: ["Portuguese", "Spanish"].join(' '),
    mood: "party_night",
    vacation: "city",
    life_choice: "travail",
    friends_age: 23,
    friends_distance: 50
  },
  {
    name: "Emilie",
    email: "ali@test.test",
    password: "desert2024",
    age: 31,
    avatar_url: "emilie.jpg",
    language: ["Arab", "French"].join(' '),
    mood: "cosy",
    vacation: "montagne",
    life_choice: "famille",
    friends_age: 30,
    friends_distance: 50
  },
  {
    name: "Sarah",
    email: "sarah@test.test",
    password: "123456",
    age: 25,
    avatar_url: "sarah.jpg",
    language: ["Indonesian", "French", "English"].join(' '),
    mood: "drink",
    vacation: "city",
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
# flashcards = {
#   mood: {
#     cosy: Rails.root.join('app/assets/images/flashcard_mood.jpg').to_s,
#     drink: Rails.root.join('app/assets/images/flashcard_mood_bar.jpg').to_s,
#     party_night: Rails.root.join('app/assets/images/flashcard_mood_fete.jpg').to_s,
#     museum: Rails.root.join('app/assets/images/flashcard_mood_musee.jpg').to_s
#   },
#   vacation: {
#     montagne: Rails.root.join('app/assets/images/flashcard_vacances_montagne.jpg').to_s,
#     plage: Rails.root.join('app/assets/images/flashcard_vacances_mer.jpg').to_s,
#     city: Rails.root.join('app/assets/images/flashcard_vacances_ville.jpg').to_s,
#     forêt: Rails.root.join('app/assets/images/flashcard_vacances_foret.jpg').to_s
#   },
#   life_choice: {
#     famille: Rails.root.join('app/assets/images/flashcard_interest_famille.jpg').to_s,
#     amour: Rails.root.join('app/assets/images/flashcard_interest_amour.jpg').to_s,
#     argent: Rails.root.join('app/assets/images/flashcard_interest_money.jpg').to_s,
#     travail: Rails.root.join('app/assets/images/flashcard_interest_pro_2.jpg').to_s
#   }
# }

begin
  users.each do |user|
    new_user = User.new(user)
    # file = URI.parse(user[:avatar_url]).open
    # new_user.avatar.attach(io: file, filename: "#{new_user.name}.png", content_type: "image/png")

    # gestion de mood, vacation, livechoice
    # checker les keys correspondantes et attach la photo qui match avec
    # mood_image = flashcards[:mood][new_user.mood.to_sym]
    # file = File.open(mood_image)
    # new_user.mood_image.attach(io: file, filename: mood_image, content_type: "image/jpg")

    # vacation_image = flashcards[:vacation][new_user.vacation.to_sym]
    # file = File.open(vacation_image)
    # new_user.vacation_image.attach(io: file, filename: vacation_image, content_type: "image/jpg")

    # life_image = flashcards[:life_choice][new_user.life_choice.to_sym]
    # file = File.open(life_image)
    # new_user.life_image.attach(io: file, filename: vacation_image, content_type: "image/jpg")

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

puts "Seed terminée avec succès"
