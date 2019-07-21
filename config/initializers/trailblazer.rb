# frozen_string_literal: true

require 'reform'
require 'reform/form/dry'
require 'jsonapi/serializable'

Dir[Rails.root.join('lib', 'macro', '**', '*.rb')].each { |file| require file }

Rails.application.configure do
  config.trailblazer.use_loader = false
  config.trailblazer.application_controller = 'ApiController'
end
