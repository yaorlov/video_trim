# frozen_string_literal: true

module Api::V1::User::Representer
  class Register < JSONAPI::Serializable::Resource
    type 'users'

    attributes :email
  end
end
