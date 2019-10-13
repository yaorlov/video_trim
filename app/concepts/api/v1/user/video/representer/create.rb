# frozen_string_literal: true

module Api::V1::User::Video::Representer
  class Create < JSONAPI::Serializable::Resource
    type 'videos'

    attributes :name

    belongs_to :user

    has_one :request do
      data do
        @object.request
      end
    end
  end
end
