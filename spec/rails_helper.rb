# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'

if ENV['RAILS_ENV'] == 'test'
  require 'simplecov'
  SimpleCov.start 'rails'
end

require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!
require 'database_cleaner'
require 'dox'
require 'mongoid-rspec'
require 'sidekiq/testing'

Dir[Rails.root.join('spec', 'api_doc', '**', '*.rb')].each { |f| require f }
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

  config.include FactoryBot::Syntax::Methods
  config.include AuthHelpers
  config.include FixtureHelpers
  config.include Mongoid::Matchers, type: :model

  config.before(:suite) do
    Sidekiq::Worker.clear_all
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.after(:each, :dox) do |example|
    # rubocop:disable Layout/IndentationWidth, Layout/ElseAlignment, Layout/EndAlignment
    example.metadata[:request] = if request.headers['CONTENT_TYPE']&.start_with?('multipart/form-data; boundary=')
      patched_request = request.dup
      def patched_request.body
        OpenStruct.new(read: request_parameters.to_json)
      end
      patched_request
    else
      request
    end
    # rubocop:enable Layout/IndentationWidth, Layout/ElseAlignment, Layout/EndAlignment

    example.metadata[:response] = response
  end

  config.around do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end

RSpec::Matchers.define_negated_matcher :avoid_changing, :change

Dox.configure do |config|
  config.headers_whitelist = %w[Accept Authorization]
end
