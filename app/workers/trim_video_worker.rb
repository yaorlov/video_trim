# frozen_string_literal: true

class TrimVideoWorker
  include Sidekiq::Worker

  def perform(request_id)
    Api::V1::User::Video::Operation::Trim.call(request_id: request_id)
  end
end
