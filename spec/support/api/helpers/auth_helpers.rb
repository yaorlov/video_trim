# frozen_string_literal: true

module AuthHelpers
  def auth_header(user)
    access_token = JWTSessions::Session.new(payload: { user_id: user.id }).login[:access]

    { 'Authorization': "Bearer #{access_token}" }
  end
end
