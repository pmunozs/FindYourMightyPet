# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"

puts 'Clearing you database...'
Creature.destroy_all
User.destroy_all


puts 'Seeding...'

3.times do |i|
  User.create(
    email: "john.doe-#{i}@demo.com",
    password: "123456"
  )
end

# RED POWER RANGER
file = URI.open("https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/780baf51363309.58eb902fbc871.jpg")
redPowerRanger = Creature.new(name: 'Red Ranger',
  age: 32,
  ability: 'Leader of the Power Rangers. Can call a dinosaur',
  description: 'The Red Ranger is usually the leader of the team, although there have been times where Rangers of other colors have been leaders. In recent times, Red Rangers have also been given the role of hot-headed rookie. Red Rangers also usually receive the most powerful weapons. The Red Ranger\'s main weapon traditionally is a sword, but some have used blasters.',
  user: User.first
)
redPowerRanger.photo.attach(io: file, filename: "red-ranger.jpg", content_type: "image/jpg")
redPowerRanger.save
file.close()

# YELLOW RANGER
file = URI.open("https://www.thechosenprime.com/thumbnail.asp?file=assets/images/other/super7/power%20rangers/ultimates/s7upr-yellow-ranger-04.jpg&maxx=600&maxy=0")
yellowRanger = Creature.new(name: 'Yellow Ranger',
  age: 25,
  ability: 'Like the Red Ranger but Yellow!',
  description:'The Yellow Ranger is usually a subordinate member of the team and are usually the teams\' morale boosters (with the exception of Taylor who once was the Wild Force Rangers\' leader before Cole\'s arrival and a rather strong-willed individual) or level-headed in the time of crisis.',
  user: User.last
)
yellowRanger.photo.attach(io: file, filename: "yellow-ranger.jpg", content_type: "image/jpg")
yellowRanger.save
file.close()

# PENNYWISE
file = URI.open("http://images5.fanpop.com/image/photos/28600000/Pennywise-stephen-kings-it-28644575-1024-768.png")
pennywise = Creature.new(
  name: 'Pennywise',
  age: 1500,
  ability: 'Being evil. Also the name for a punk rock band.',
  description:'Pennywise has two weaknesses, and those who can see him need to know what it is to overcome this terrifying entity. Bloody-Disgusting says that the two fears of It are courage and heart. In the films, the characters who survive are those who have shown both of these traits.',
  user: User.last
)
pennywise.photo.attach(io: file, filename: "pennywise.jpg", content_type: "image/jpg")
pennywise.save
file.close()

# UNICORN
file = URI.open("http://images4.fanpop.com/image/photos/22700000/Unicorn-unicorns-22728292-1024-768.jpg")
pennywise = Creature.new(
  name: 'Unicorn',
  age: 750,
  ability: 'Makes rainbows out of the horn',
  description:'The unicorn is a legendary creature that has been described since antiquity as a beast with a single large, pointed, spiraling horn projecting from its forehead.',
  user: User.first
)
pennywise.photo.attach(io: file, filename: "unicorn.jpg", content_type: "image/jpg")
pennywise.save
file.close()


# HIPPOGRIFF
file = URI.open("https://pm1.narvii.com/5955/78dc89a3e9409aa186e73aac5beb9e0d064c115b_hq.jpg")
hippogriff = Creature.new(
  name: 'Hippogriff',
  age: 2576,
  ability: 'Can fly but also run fast',
  description: 'This particular creature was owned by Harry Potter.',
  user: User.first
)
hippogriff.photo.attach(io: file, filename: "hippogriff.jpg", content_type: "image/jpg")
hippogriff.save
file.close()

# JUMANJI
file = URI.open("https://scontent.ccdn.cloud/image/nospoiler/33d7f7df-6d3c-4356-8a6a-39504403da58/jumanji-robin-williams-1-1200x630.jpg")
jumanji = Creature.new(
  name: 'Robbie Williams - Jumanji',
  age: 120,
  ability: 'Can jump out of board games',
  description: 'After Alan inadvertently rolls a five, a message tells him to wait in a jungle until someone rolls a five or eight, and he is sucked into the game. Afterwards, a swarm of bats appears and chases Sarah out of the mansion.',
  user: User.last
)
jumanji.photo.attach(io: file, filename: "jumanji.jpg", content_type: "image/jpg")
jumanji.save
file.close()


puts 'Go Go Power Rangers!'
