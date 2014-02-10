# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
load("lib/import_science_health.rb")

puts "Lean back and enjoy the show, this may take a while.."

puts "-> Importing English Science & Health text"
import_english_sh

puts "-> Creating autotranslation user"
User.where(:email => 'cshackathon@gmail.com')
  .first_or_create(:password => 'this_is_not_a_password', :name => 'autotranslation')
  #ENV['EMAIL_PASSWORD'] this is the production password

user = User.where(email: 'cshackathon@gmail.com').take

puts "-> Importing Chinese Google Translation preseed"
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

puts "All done!"