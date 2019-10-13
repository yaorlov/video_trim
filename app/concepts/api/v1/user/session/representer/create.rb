# frozen_string_literal: true

module Api::V1::User::Session::Representer
  class Create < JSONAPI::Serializable::Resource
    id { Time.zone.now }

    type 'tokens'

    attribute :access do
      payload = { user_id: @object.id }
      session = ::JWTSessions::Session.new(payload: payload)

      session.login[:access]
    end
  end
end
