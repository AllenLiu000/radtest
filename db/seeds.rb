# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Timezone.create!(city:  "Melbourne", offset: 0)

Timezone.create!(city:  "San Francisco", offset: -17)

Timezone.create!(city:  "Tokyo", offset: -1)