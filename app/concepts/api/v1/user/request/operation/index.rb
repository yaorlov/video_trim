# frozen_string_literal: true

module Api::V1::User::Request::Operation
  class Index < Trailblazer::Operation
    step :model
    step :renderer_options

    def model(ctx, current_user:, **)
      ctx[:model] = current_user.requests
    end

    def renderer_options(ctx, **)
      ctx[:renderer_options] = {
        class: {
          Request: Api::V1::User::Request::Representer::Index
        }
      }
    end
  end
end
