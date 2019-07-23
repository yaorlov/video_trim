# frozen_string_literal: true

module Api::V1::User::Representer
  class CreateSession < JSONAPI::Serializable::Resource
    id { Time.zone.now }

    type 'tokens'

    attribute :access do
      payload = { user_id: @object.id }
      session = ::JWTSessions::Session.new(payload: payload)

      session.login[:access]
    end
  end
end
