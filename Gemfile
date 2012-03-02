source 'https://rubygems.org'

gem 'rails', '3.2.1'

gem 'sqlite3', :group => [:test, :development]
gem 'mysql2',  :group => [:production]

gem 'chosen-rails'
gem 'haml'
gem 'jquery-rails'
gem 'json'
gem 'validates_existence'

group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'twitter-bootstrap-rails'
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

group :test do
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'shoulda-matchers'
end
