# frozen_string_literal: true

FactoryBot.define do
  factory :video do
    user
    name { FFaker::Lorem.word }
    duration { rand(1..3) }
    source_file { Rack::Test::UploadedFile.new('spec/fixtures/files/short_video.mp4', 'video/mp4') }
  end
end
