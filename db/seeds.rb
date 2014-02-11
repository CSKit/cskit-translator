# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require './lib/science_health_importer'
require './lib/chinese_translation_importer'

puts "Lean back and enjoy the show, this may take a while.."
puts "-> Importing English Science & Health text... "
ScienceHealthImporter.import(ENV["BY_PARAGRAPH"] == "true")

puts "-> Importing Chinese Google Translation preseed... "
ChineseTranslationImporter.import

puts "All done!"