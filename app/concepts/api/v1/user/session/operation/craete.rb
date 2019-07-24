# frozen_string_literal: true

module Api::V1::User::Session::Operation
  class Create < Trailblazer::Operation
    pass Macro::Semantic(success: :created)

    step Rescue(Mongoid::Errors::DocumentNotFound) {
      step :model
    }
    fail Macro::Semantic(failure: :unauthenticated)
    step Contract::Build(constant: Api::V1::User::Session::Contract::Create)
    step Contract::Validate(), fail_fast: true
    step :authenticate
    fail Macro::Semantic(failure: :unauthenticated)
    step :create_session
    step :renderer_options

    def model(ctx, params:, **)
      ctx[:model] = User.find_by!(email: params[:email])
    end

    def authenticate(ctx, params:, **)
      ctx[:model].authenticate(params[:password])
    end

    def create_session(ctx, **)
      payload = { user_id: ctx[:model].id }
      session = ::JWTSessions::Session.new(payload: payload)
      ctx[:access_token] = session.login[:access]
    end

    def renderer_options(ctx, **)
      ctx[:renderer_options] = {
        class: {
          User: Api::V1::User::Session::Representer::Create
        }
      }
    end
  end
end
