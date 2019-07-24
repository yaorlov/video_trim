# frozen_string_literal: true

require 'rails_helper'

describe 'Api::V1::Users::Video', type: :request do
  include ApiDoc::V1::Users::Video::Api

  describe 'POST #create' do
    include ApiDoc::V1::Users::Video::Create

    describe 'Success' do
      let(:user) { create :user }
      let(:valid_params) do
        {
          name: 'test video',
          source_file: fixture_file_upload('files/short_video.mp4', 'video/mp4'),
          trimming_start_time: 1,
          trimming_end_time: 3
        }
      end

      before { post '/api/v1/users/video', params: valid_params, headers: auth_header(user) }

      it 'renders video data', :dox do
        expect(response).to be_created
        expect(response).to match_schema(VideoSchema::Success)
      end
    end
  end
end
