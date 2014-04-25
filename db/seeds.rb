# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category_attributes = [{name: 'Wrecks/Artifacts', image: 'categories/Wrecks.jpg'},
 {name: 'Caves', image: 'categories/Caves.jpg'},
 {name: 'Drift', image: 'categories/Drift.jpg'},
 {name: 'Walls', image: 'categories/Walls.jpg'},
 {name: 'Whales & Sharks', image: 'categories/Sharks.jpg'},
 {name: 'Macro/Corals', image: 'categories/Corals.jpg'},
 {name: 'Manta Rays', image: 'categories/Manta.jpg'},
 {name: 'Night', image: 'categories/Night.jpg'},
 {name: 'Turtles', image: 'categories/Turtles.jpg'},
 {name: 'Schools of Fish', image: 'categories/Fish.jpg'}]

category_attributes.each do |attributes|
  category = Category.find_or_create_by!({name: attributes[:name]})
  category.image = attributes[:image]
  category.save!
end

month_attributes = [{name: 'January'}, {name: 'February'},
  {name: 'March'}, {name: 'April'}, {name: 'May'},
  {name: 'June'}, {name: 'July'}, {name: 'August'},
  {name: 'September'}, {name: 'October'}, {name: 'November'},
  {name: 'December'}]

month_attributes.each do |month|
  Month.find_or_create_by!(month)
end
