source 'https://rubygems.org'

gem 'rails', '3.2.11'

gem 'jquery-rails'
gem 'will_paginate'
gem 'actionmailer_inline_css'
gem 'json'
gem 'bson_ext'
gem 'rack-raw-upload', '1.1.0'
gem 'carrierwave'
gem 'mini_magick'
gem 'strong_parameters'

group :development, :test do
	gem 'mysql2'
	gem 'devise', "2.2.5"
	gem 'pry'
	gem 'pry-nav'
	gem "rspec-rails", ">= 2.12.2"
	gem 'guard-rspec'
	gem "rb-fsevent"
	gem "autotest-standalone"
	gem "test_notifier"
	gem 'tlsmail'
	gem 'prawn'
	gem 'bcrypt-ruby', '~> 3.0.0'
	gem 'capybara'
	gem 'cucumber'
end

# Deploy with Capistrano
gem "capistrano"

group :assets do
  	gem 'sass-rails',   '~> 3.2.3'
  	gem 'coffee-rails', '~> 3.2.1'
  	gem 'uglifier', '>= 1.0.3'
end

group :development do
	gem "quiet_assets", ">= 1.0.2"
	gem "figaro", ">= 0.6.3"
	gem "better_errors", ">= 0.7.2"
	gem "binding_of_caller", ">= 0.7.1", :platforms => [:mri_19, :rbx] 
end

group :test do
	gem 'cucumber-rails'
	gem 'guard-cucumber'
  	gem "spork"
  	gem "guard-spork"
	gem 'database_cleaner'
	gem 'growl'
	gem 'rb-fsevent'
	gem 'turn'
end
