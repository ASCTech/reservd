source 'https://rubygems.org'

gem 'rails', '3.2.1'

gem 'sqlite3', :group => [:test, :development]
gem 'mysql2',  :group => [:production]

gem 'jquery-rails'
gem 'json'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier',     '>= 1.0.3'
end

group :development, :production do
  gem 'therubyracer'
end

group :development, :test do
  gem 'rspec'
  gem 'rspec-rails'
end

group :development do
  gem 'capistrano'
  gem 'thin'
end
