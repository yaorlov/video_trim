# frozen_string_literal: true

class VideoUploader < Shrine
  plugin :determine_mime_type
  plugin :validation_helpers

  Attacher.validate do
    validate_extension_inclusion %w[mov mp4 3gp mkv webm m4v avi]
  end
end
