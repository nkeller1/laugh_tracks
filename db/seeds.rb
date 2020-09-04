# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
com1 = Comedian.create({ name: "Nate", age: 35, city: "Denver" })

com2 = Comedian.create( name: "J Dog", age: 30, city: "Arvada")

com1.tvspecials.create(name: 'All About Me', runtime: 70)
com1.tvspecials.create(name: 'Not My Special', runtime: 100)
com2.tvspecials.create(name: 'Comedian2 Special', runtime: 90)
com2.tvspecials.create(name: 'Really, Kitty?', runtime: 80)
