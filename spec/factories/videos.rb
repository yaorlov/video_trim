# frozen_string_literal: true

FactoryBot.define do
  factory :video do
    transient do
      with_trimmed_file { false }
    end

    user
    name { FFaker::Lorem.word }
    duration { rand(1..3) }
    source_file { Rack::Test::UploadedFile.new('spec/fixtures/files/short_video.mp4', 'video/mp4') }

    after(:build) do |video, evaluator|
      if evaluator.with_trimmed_file
        video.trimmed_file = Rack::Test::UploadedFile.new('spec/fixtures/files/short_video.mp4', 'video/mp4')
      end
    end
  end
end
