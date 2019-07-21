# frozen_string_literal: true

module Api
  module V1
    module Users
      class RegistrationsController < ApiController
        def create
          endpoint Api::V1::User::Operation::Register
        end
      end
    end
  end
end
