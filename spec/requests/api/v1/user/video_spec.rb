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
          duration: 2
        }
      end

      before { post '/api/v1/users/video', params: valid_params, headers: auth_header(user) }

      it 'renders video data', :dox do
        expect(response).to be_created
        expect(response).to match_schema(VideoSchema::Success)
      end
    end

    describe 'Fail' do
      context 'when no auth headers passed' do
        before { get '/api/v1/users/requests' }

        it 'renders error data', :dox do
          expect(response).to be_unauthorized
          expect(response).to match_schema(ErrorSchema::Unauthorized)
        end
      end

      context 'when invalid auth token passed' do
        before { get '/api/v1/users/requests', headers: { 'Authorization' => 'token' } }

        it 'renders error data', :dox do
          expect(response).to be_unauthorized
          expect(response).to match_schema(ErrorSchema::Unauthorized)
        end
      end
    end
  end
end
