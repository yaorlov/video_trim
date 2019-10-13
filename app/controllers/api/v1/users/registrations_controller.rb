# frozen_string_literal: true

module Api
  module V1
    module Users
      class RegistrationsController < ApiController
        def create
          endpoint Api::V1::User::Registration::Operation::Create
        end
      end
    end
  end
end
