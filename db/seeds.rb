# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"
Creature.destroy_all
10.times do
  file = URI.open("https://entertainment.time.com/wp-content/uploads/sites/3/2013/05/fictioninfluence_poll_frankenstein.jpg")
  creature = Creature.new(name: Faker::TvShows::Supernatural.creature,
    age: Faker::Number.within(range: 1..10_000),
    ability: Faker::Superhero.power,
    description: Faker::Restaurant.review,
    user: User.first
  )
creature.photo.attach(io: file, filename: "nes.jpg", content_type: "image/jpg")
creature.save
file.close()
end
