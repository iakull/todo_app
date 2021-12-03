# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# config = YAML.load(File.read('db/seeds/seeds.yml')) 
# Rails.root.join('db', 'seeds', 'seeds.yml')
# config = YAML::load_file(seed_file)

config = YAML.load(File.read('db/seeds/seeds.yml')).with_indifferent_access 
projects = config["projects"]
projects.each do |project|
  created_project = Project.create!(title: project[:title])
  created_project.todos.create!(project[:todos])
end