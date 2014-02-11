# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

CSKitTranslator::Application.load_tasks

PRESEED_EMAIL = "cshackathon@gmail.com"

task :create_preseed_user => :environment do
  User.where(:email => PRESEED_EMAIL)
    .first_or_create(:password => ENV['EMAIL_PASSWORD'])
end

task :preseed => [:environment, :create_preseed_user] do
  google = GoogleFish.new(ENV['GOOGLE_KEY'])
  user = User.where(:email => 'cshackathon@gmail.com').first

  # Phrase.find_in_batches(:start => 1, :batch_size => 5) do |batch|
  Phrase.limit(5).each do |phrase|
    # batch.each do |phrase|
      phrase.translations.create(
        :translation => google.translate(:en, :zh, phrase.key),
        :user_id => user.id,
        :locale => "zh"
      )
    # end
  end
end

# it would be awesome to eventually turn this stuff into factories
task :preseed_fake => [:environment, :create_preseed_user] do
  translator = User.where(:email => PRESEED_EMAIL).first
  alphabet = ('a'..'z').to_a + ('A'..'Z').to_a
  rand = Random.new
  fake_phrase_count = 200

  voter1 = User.where(:email => "voter1@cskit.org")
    .first_or_create(:password => "foobar")

  voter2 = User.where(:email => "voter2@cskit.org")
    .first_or_create(:password => "foobar")

  $stdout.write "Clearing all phrases, translations, and votes... "

  Phrase.delete_all
  Translation.delete_all
  Vote.delete_all

  puts "done!"

  fake_phrase_count.times do |i|
    $stdout.write("\rCreating fake phrase #{i + 1}/#{fake_phrase_count}")

    phrase = Phrase.create!(
      :key => alphabet.sample(rand.rand(20..50)).join,
      :sort_key => i
    )

    rand.rand(1..5).times do
      trans = phrase.translations.create!(
        :locale => "zh",
        :translation => alphabet.sample(rand.rand(20..50)).join,
        :user_id => translator.id
      )

      rand.rand(5..10).times do
        trans.votes.create!(
          :user_id => [voter1, voter2].sample.id,
          :value => [1, -1].sample
        )
      end
    end
  end

  $stdout.write("\n")
end
