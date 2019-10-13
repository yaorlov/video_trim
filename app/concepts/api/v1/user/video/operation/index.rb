# frozen_string_literal: true

module Api::V1::User::Video::Operation
  class Index < Trailblazer::Operation
    step :model
    step :renderer_options

    def model(ctx, current_user:, **)
      ctx[:model] = current_user.videos.where(:trimmed_file_data.nin => ['', nil]).entries
    end

    def renderer_options(ctx, **)
      ctx[:renderer_options] = {
        class: {
          Video: Api::V1::User::Video::Representer::Index
        }
      }
    end
  end
end
