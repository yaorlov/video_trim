# frozen_string_literal: true

class Video
  include Mongoid::Document
  include Mongoid::Timestamps
  include VideoUploader::Attachment.new(:trimmed_file)
  include VideoUploader::Attachment.new(:source_file)

  belongs_to :user
  has_one :request, dependent: :destroy

  field :name, type: String
  field :duration, type: Integer
  field :trimmed_file_data, type: String
  field :source_file_data, type: String
end

# User
#   - videos
#   - requests

# Request
#   - start
#   - end
#   - video source
#   - status

# Video
#   - name
#   - trimmed video link
#   - duration
