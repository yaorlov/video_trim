# frozen_string_literal: true

module Api
  module V1
    module Users
      class SessionsController < ApiController
        def create
          endpoint Api::V1::User::Operation::CreateSession
        end
      end
    end
  end
end
