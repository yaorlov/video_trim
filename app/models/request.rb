# frozen_string_literal: true

class Request
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :video
  belongs_to :user

  field :trimming_start_time, type: Integer
  field :trimming_end_time, type: Integer
end
