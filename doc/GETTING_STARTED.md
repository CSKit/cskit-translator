=== Getting Started Guide ===

So glad you could join us!

First things first, let's get you setup to play with the code!

== Quick Command Reference ==

If you are setting up a second development environment or know what you are doing, these are the commands you are looking for. If this is the first time or you need more information, please keep reading:

git clone git@github.com:CSKit/cskit-translator.git
cd cskit-translator
bundle exec rake db:migrate RAILS_ENV=development
bundle exec rake db:seed
bundle exec rails server


== Installation Instructions ==

While we hope to cover the majority of environments, the following instructions are not necessarily comprehensive. Please fork the project and issue pull requests with updates when you encounter differences.

=== Prerequisites ===

These are what worked so far. Earlier versions may work too.

 * Ruby >= 1.9.1
 * rake >= 10.1.1
 * libsqlite >= 3.7.9
 * Bundler >= 1.5.2

==== Debian/Ubuntu ====

These instructions worked for 12.04 and up.

First, check your ruby version to see if it is compatible:

```
ruby --version
0.7.8pre
```

If super old like mine was, find a good PPA to install updated ruby files from, such as:

```
sudo add-apt-repository ppa:ubuntu-on-rails/ppa
```

Packages to remove/install:

```
sudo apt-get update

sudo apt-get purge ruby

sudo apt-get install libsqlite3-dev libpq-dev bundler ruby1.9.1-full git-core
```

Now update the paths to make sure you're loading the correct executables:

```
sudo ln -s /usr/bin/rake1.9.1 /usr/bin/rake
sudo rm /etc/alternatives/ruby /usr/bin/bundle
sudo ln -s /usr/bin/ruby1.9.1 /etc/alternatives/ruby
sudo ln -s /usr/bin/gem1.9.1 /etc/alternatives/gem
sudo gem update
```

==== Centos/Red Hat ====

Need help!

==== Mac OS/X ====

Need help!

==== Windows ====

Need help!

== Next Steps ==

Now that you hopefully have your environment setup, let's install the project!


=== This is the clone you're looking for ===

The repository exists at https://github.com/CSKit/cskit-translator

If you are new to git, please refer to Github's docs about forking a repo: https://help.github.com/articles/fork-a-repo

Ideally you have signed up for a Github account and can fork the project into your own private repository. Either way, clone the repo of your choosing to your local dev environment using one of the following:

```
git clone git@github.com:CSKit/cskit-translator.git

git clone https://github.com/CSKit/cskit-translator.git

git clone git@github.com:your_username/cskit-translator.git

git clone https://github.com/your_username/cskit-translator.git
```

For more dicussion on which remote URL to use, read here: https://help.github.com/articles/which-remote-url-should-i-use

Read about setting up SSH access to your repositories here: https://help.github.com/categories/56/articles

I personally prefer remotes via SSH and SSH keys.

=== Let's get fired up! ===

Now that you have the project checked out, let's get it started!

```
cd cskit-translator
bundle install
bundle exec rake db:migrate RAILS_ENV=development
bundle exec rails r lib/import_science_health.rb

bundle exec rails server
```

Navigate your browser over to http://localhost:3000 to see the site!

Checkout the Github Issues (https://github.com/CSKit/cskit-translator/issues) for suggested tasks.

Join the mailing list: https://groups.google.com/forum/#!forum/cskit

Happy hacking!!!
