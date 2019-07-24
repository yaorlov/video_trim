# frozen_string_literal: true

module Api::V1::User::Registration::Representer
  class Create < JSONAPI::Serializable::Resource
    type 'users'

    attributes :email
  end
end
