# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Pets.delete_all
# . . .
Pets.create(
	species: 'cat',
	name: 'Fluffy',
	description: %{<p>
	Cats are fluffy animals that eat birds
	</p>},
	image_url: '/images/turtle.jpg',
	age: 49.0
)
# . . .
