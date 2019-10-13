# frozen_string_literal: true

module Api::V1::User::Request::Representer
  class Index < JSONAPI::Serializable::Resource
    type 'requests'

    attribute :status do
      Request::STATUSES.key(@object.status)
    end

    belongs_to :user
    belongs_to :video
  end
end
