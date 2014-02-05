# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

CSKitTranslator::Application.load_tasks

task :create_preseed_user => :environment do
  User.where(:email => 'cshackathon@gmail.com')
    .first_or_create(:password => 'this_is_not_a_password', :name => 'autotranslation')
    #ENV['EMAIL_PASSWORD'] this is the production password
end

task :preseed => :environment do
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