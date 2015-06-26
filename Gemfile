source 'https://rubygems.org'

ruby '2.2.2'
gem 'rails', '4.2.1'

group :development, :test do
  gem 'sqlite3'
  gem 'byebug'
  gem'rspec-rails', '~> 2.14.0'
  gem 'simplecov'
end


group :production do

  gem 'pg'
end

group :assets do
  gem 'uglifier'
  gem 'therubyracer'
  gem 'sass-rails'
  gem 'coffee-rails'
end

gem 'protected_attributes'
gem 'jquery-rails'
gem 'haml'

group :development,:test do  
  # ... other gems
  gem 'database_cleaner'
  gem 'cucumber-rails', :require => false
end
