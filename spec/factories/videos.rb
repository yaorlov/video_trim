# frozen_string_literal: true

FactoryBot.define do
  factory :video do
    name { FFaker::Lorem.word }
    trimming_start_time { rand 0..3 }
    trimming_end_time { trimming_start_time + (rand 0..3) }
    source_file { Rack::Test::UploadedFile.new('spec/fixtures/files/short_video.mp4', 'video/mp4') }
  end
end
