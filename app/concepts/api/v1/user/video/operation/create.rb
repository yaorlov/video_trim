# frozen_string_literal: true

module Api::V1::User::Video::Operation
  class Create < Trailblazer::Operation
    pass Macro::Semantic(success: :created)

    step :model
    step Contract::Build(constant: Api::V1::User::Video::Contract::Create)
    step Contract::Validate(), fail_fast: true
    step Contract::Persist()
    step :create_trimming_request
    step :perform_trimming_worker
    step :renderer_options

    def model(ctx, current_user:, **)
      ctx[:model] = current_user.videos.new
    end

    def create_trimming_request(ctx, params:, model:, current_user:, **)
      ctx[:request] = current_user.requests.create(
        trimming_start_time: params['trimming_start_time'],
        video_id: model.id
      )
    end

    def perform_trimming_worker(ctx, **)
      TrimVideoWorker.perform_async(ctx[:request].id)
    end

    def renderer_options(ctx, **)
      ctx[:renderer_options] = {
        class: {
          Video: Api::V1::User::Video::Representer::Create
        }
      }
    end
  end
end
