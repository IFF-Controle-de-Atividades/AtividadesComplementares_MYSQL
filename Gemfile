source 'https://rubygems.org'

gem 'rails', '3.2.11'

gem 'json'
gem 'bson_ext'
gem 'jquery-rails'

group :development, :test do
	gem 'mysql2'
	gem 'devise', "2.2.5"
	gem 'prawn'
	gem 'carrierwave'
	gem 'mini_magick'
	gem 'strong_parameters'
	gem 'rack-raw-upload', '1.1.0'
	
	gem 'tlsmail'
	gem "mailcatcher", "~> 0.5.12"
	gem "mail", "2.4.4"
	gem 'actionmailer_inline_css'

	gem 'bcrypt-ruby', '~> 3.0.0'
	gem 'capybara'
	
	gem 'pry'
	gem 'pry-nav'
	gem 'will_paginate'
	gem "rspec-rails", ">= 2.12.2"
	gem 'guard-rspec'
	gem 'test_notifier'
	gem 'autotest-standalone'
	gem "rb-fsevent"

	gem 'bcrypt-ruby', '~> 3.0.0'
end

# Deploy with Capistrano
gem "capistrano"
gem "unicorn"
gem "rvm-capistrano"

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'therubyracer', :platforms => :ruby
	gem "less-rails"
end

gem "twitter-bootstrap-rails", '~> 2.2.6'

group :development do
	gem "quiet_assets", ">= 1.0.2"
	gem "figaro", ">= 0.6.3"
	gem "better_errors", ">= 0.7.2"
	gem "binding_of_caller", ">= 0.7.1", :platforms => [:mri_19, :rbx] 
end

group :test do
	gem 'cucumber'
	gem 'cucumber-rails'
	gem 'guard-cucumber'
  gem "spork"
  gem "guard-spork"
	gem 'database_cleaner'
	gem 'growl'
	gem 'rb-fsevent'
	gem 'turn'
end