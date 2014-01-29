source 'https://rubygems.org'

ruby '2.1.0'

# Use Rails 4
gem 'rails', '~> 4.0'

# Use thin as the server
# TODO: Fix thin on Ruby 2.1 and re-enable it
#gem 'thin', '~> 1.5'

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
gem 'sass-rails'

# Use CoffeeScript for scripts
gem 'coffee-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
#gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0.2'

gem 'yard'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :test do
  #gem 'simplecov', '~> 0.7', require: false
  gem 'coveralls', require: false
  gem 'zonebie'
end

group :development do
  gem 'binding_of_caller'
  gem 'better_errors'
  gem 'foreman'
  gem 'yard-activerecord'
  gem 'redcarpet'
end

# Time parsing
gem 'chronic', '~> 0.9'

# Use New Relic for monitoring
gem 'newrelic_rpm'
