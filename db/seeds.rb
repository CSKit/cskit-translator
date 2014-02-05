# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.where(email: 'cshackathon@gmail.com').take

File.open("lib/cskit-translator-seed", "r").each_line do |line|
  translation, phrase_id, locale = line.split('|')
  Translation.where(
  	:user_id => user.id,
  	:phrase_id => phrase_id,
  	:locale => "zh")
  .first_or_create(
  	:user_id => user.id,
  	:phrase_id => phrase_id,
  	:locale => "zh",
  	:translation => translation
  	)
end  
