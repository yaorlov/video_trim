# frozen_string_literal: true

module Api::V1::User::Video::Representer
  class Index < JSONAPI::Serializable::Resource
    type 'videos'

    attribute :duration do
      Time.zone.at(@object.duration).strftime(Constants::FFMPEG_TIME_FORMAT)
    end

    attribute :url do
      @object.trimmed_file.url
    end

    belongs_to :user
    belongs_to :request
  end
end
