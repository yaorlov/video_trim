# frozen_string_literal: true

class Request
  include Mongoid::Document
  include Mongoid::Timestamps

  STATUSES = { scheduled: 1, processing: 2, done: 3, failed: 4 }.freeze

  belongs_to :video
  belongs_to :user

  field :trimming_start_time, type: Integer
  field :status, type: Integer, default: STATUSES[:scheduled]
end
