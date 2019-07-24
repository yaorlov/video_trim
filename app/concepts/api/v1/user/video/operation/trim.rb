# frozen_string_literal: true

require 'streamio-ffmpeg'
require 'tempfile'

module Api::V1::User::Video::Operation
  class Trim < Trailblazer::Operation
    pass Macro::Semantic(success: :created)

    step Rescue(Mongoid::Errors::DocumentNotFound) {
      step :model
    }
    fail Macro::Semantic(failure: :not_found)

    step :movie
    step :transcode
    step :update_video
    step :delete_temp_file

    def model(ctx, params:, **)
      return false unless params[:request_id]

      ctx[:model] = Request.find(params[:request_id])
    end

    def movie(ctx, model:, **)
      source_video = model.video.source_file.download
      ctx[:movie] = FFMPEG::Movie.new(source_video.path)
    end

    def transcode(ctx, model:, movie:, **)
      ctx[:transcoded] = Tempfile.new(['transcoded', '.mp4'], binmode: true)

      movie.transcode(
        ctx[:transcoded].path,
        ['-ss', ffmpeg_time(model.trimming_start_time), '-t', ffmpeg_time(model.video.duration)]
      )
    end

    def update_video(_ctx, model:, transcoded:, **)
      model.video.update(trimmed_file: transcoded)
    end

    def delete_temp_file(_ctx, transcoded:, **)
      transcoded.delete
    end

    private

    def ffmpeg_time(seconds)
      Time.zone.at(seconds).strftime(Constants::FFMPEG_TIME_FORMAT)
    end
  end
end
