source 'https://rubygems.org'

# Use Rails 4
gem 'rails', '~> 4.1'

# Use thin as the server
gem 'thin', '~> 1.6'

# Use sqlite3 and postgresql as the databases for Active Record
group :production do
  gem 'pg'
end
group :development, :test do
  gem 'sqlite3'
end

# Add Heroku integration for Rails 4
group :production do
  gem 'rails_12factor'
end

gem 'haml'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'

# Use CoffeeScript for scripts
gem 'coffee-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.1'

gem 'yard'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :test do
  gem 'codeclimate-test-reporter', require: nil
  gem 'zonebie'
end

group :development do
  gem 'spring'
  gem 'yard-activerecord'
  gem 'redcarpet'
end

# Time stuff
gem 'chronic', '~> 0.9'
gem 'ice_cube'
