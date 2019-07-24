# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'jsonapi-rails', github: 'jsonapi-rb/jsonapi-rails'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use Puma as the app server
gem 'mongoid', '~> 6.2.0'
gem 'puma', '~> 3.11'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Authentication
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'jwt_sessions', '~> 2.3', '>= 2.3.1'

# Trailblazer bundle
gem 'trailblazer-endpoint', github: 'trailblazer/trailblazer-endpoint'
gem 'trailblazer-rails', '~> 2.1', '>= 2.1.7'

# dry-rb
gem 'dry-validation', '0.11.1'

# In-memory store
gem 'redis', '~> 4.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

# Files uploading
gem 'shrine-mongoid', '~> 0.2'

# Video processing
gem 'streamio-ffmpeg', '~> 3.0'

# Background jobs
gem 'sidekiq', '~> 5.2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'bullet'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dox', require: false
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop-rspec'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # linters
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'fasterer'
  gem 'rails_best_practices'
  gem 'rubocop', require: false
end

group :test do
  gem 'database_cleaner'
  gem 'shrine-memory'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
