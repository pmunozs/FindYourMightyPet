# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

Creature.destroy_all

10.times do
  Creature.create(name: Faker::TvShows::Supernatural.creature,
                  age: Faker::Number.within(range: 1..10_000),
                  ability: Faker::Superhero.power,
                  description: Faker::Restaurant.review)
end
