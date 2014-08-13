source 'https://rubygems.org'

gem 'rails', '3.2.16'

gem 'json'
gem 'bson_ext'
gem 'jquery-rails'


group :development, :test do
	gem 'mysql2'  
	gem 'devise', "2.2.5"
	gem 'prawn'
	
	gem 'pry'
	gem 'pry-nav'
	
	gem 'will_paginate', '~> 3.0'
	gem "cancan"
	
	gem 'carrierwave'
	gem 'mini_magick'
	gem 'strong_parameters'
	gem 'rack-raw-upload', '1.1.0'

	gem 'tlsmail'
	gem "mailcatcher"
	gem "mail"
	gem 'actionmailer_inline_css'
end

gem 'bcrypt-ruby', '~> 3.0.0'

# Deploy with Capistrano
#gem "capistrano"
gem "mina"
gem "unicorn"
#gem "rvm-capistrano"

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'therubyracer', :platforms => :ruby
  gem "less-rails"
end

gem "twitter-bootstrap-rails", '~> 2.2.6'

group :test do
	gem 'cucumber'
	gem 'capybara'
	gem 'rspec-rails'
	gem 'cucumber-rails', :require => false
  	
	gem 'factory_girl_rails'
	gem 'email_spec'
	
	gem 'guard-rspec'
	gem 'database_cleaner'
	gem "launchy"

	gem 'test_notifier'
	gem 'autotest-standalone'
	gem "rb-fsevent"
end
