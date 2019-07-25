# frozen_string_literal: true

module Api
  module V1
    module Users
      class RequestsController < ApiController
        before_action :authorize_access_request!

        def index
          endpoint Api::V1::User::Request::Operation::Index, current_user: current_user
        end

        def restart
          endpoint Api::V1::User::Request::Operation::Restart, current_user: current_user
        end
      end
    end
  end
end
