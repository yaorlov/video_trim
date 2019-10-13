# frozen_string_literal: true

FactoryBot.define do
  factory :request do
    user
    video
    trimming_start_time { rand 0..3 }
  end
end
