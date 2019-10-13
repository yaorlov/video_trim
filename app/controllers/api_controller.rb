# frozen_string_literal: true

class ApiController < ApplicationController
  include DefaultEndpoint
  include JWTSessions::RailsAuthorization
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  private

  def current_user
    @current_user ||= User.find(payload['user_id'])
  end

  def not_authorized
    render_errors({ errors: { nil => ['Not authorized'] } }, 401)
  end
end
