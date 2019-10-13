# frozen_string_literal: true

module Api::V1::User::Request::Operation
  class Restart < Trailblazer::Operation
    step Rescue(Mongoid::Errors::DocumentNotFound) {
      step :model
    }, fail_fast: true

    step :schedule
    step :perform_trimming_worker
    step :renderer_options

    def model(ctx, current_user:, params:, **)
      ctx[:model] = current_user.requests.find(params[:id])
    end

    def schedule(_ctx, model:, **)
      model.update(status: Request::STATUSES[:scheduled])
    end

    def perform_trimming_worker(_ctx, model:, **)
      TrimVideoWorker.perform_async(model.id)
    end

    def renderer_options(ctx, **)
      ctx[:renderer_options] = {
        class: {
          Request: Api::V1::User::Request::Representer::Restart
        }
      }
    end
  end
end
