# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
tags = Tag.create([{topic: "Home"},{topic: "China"},{topic: "Coding"}, {topic: "Family"}])
Tag.create(topic: "Recipe")
Tag.create(topic: "Travel")
Tag.create(topic: "Fashion/Beauty")
Tag.create(topic: "Humour")

Blog.create({title: "Intro", body: "this is a test"})