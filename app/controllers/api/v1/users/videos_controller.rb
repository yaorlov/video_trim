# frozen_string_literal: true

module Api
  module V1
    module Users
      class VideosController < ApiController
        before_action :authorize_access_request!

        def create
          endpoint Api::V1::User::Video::Operation::Create, current_user: current_user
        end
      end
    end
  end
end
