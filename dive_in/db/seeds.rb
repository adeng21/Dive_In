# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category_attributes = [{name: 'Wrecks/Artifacts', image: Rails.root.to_s + '/assets/images/categories/Wrecks.jpg'},
 {name: 'Caves', image: Rails.root.to_s + '/app/assets/images/categories/Caves.jpg'},
 {name: 'Drift', image: Rails.root.to_s + '/app/assets/images/categories/Drift.jpg'},
 {name: 'Walls', image: Rails.root.to_s + '/app/assets/images/categories/Walls.jpg'},
 {name: 'Whales & Sharks', image: Rails.root.to_s + '/app/assets/images/categories/Sharks.jpg'},
 {name: 'Macro/Corals', image: Rails.root.to_s + '/app/assets/images/categories/Corals.jpg'},
 {name: 'Manta Rays', image:Rails.root.to_s + '/app/assets/images/categories/Manta.jpg'},
 {name: 'Night', image: Rails.root.to_s + '/app/assets/images/categories/Night.jpg'},
 {name: 'Turtles', image: Rails.root.to_s + '/app/assets/images/categories/Turtles.jpg'},
 {name: 'Schools of Fish', image: Rails.root.to_s + '/app/assets/images/categories/Fish.jpg'}]

category_attributes.each do |category|
  Category.find_or_create_by(category)
end

month_attributes = [{name: 'January'}, {name: 'February'},
  {name: 'March'}, {name: 'April'}, {name: 'May'},
  {name: 'June'}, {name: 'July'}, {name: 'August'},
  {name: 'September'}, {name: 'October'}, {name: 'November'},
  {name: 'December'}]

month_attributes.each do |month|
  Month.find_or_create_by(month)
end
