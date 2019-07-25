# frozen_string_literal: true

require 'rails_helper'

describe 'Api::V1::Users::Video', type: :request do
  include ApiDoc::V1::Users::Video::Api

  let(:user) { create :user }

  describe 'POST #create' do
    include ApiDoc::V1::Users::Video::Create

    describe 'Success' do
      let(:valid_params) do
        {
          name: 'test video',
          source_file: fixture_file_upload('files/short_video.mp4', 'video/mp4'),
          trimming_start_time: 1,
          duration: 2
        }
      end

      before { post '/api/v1/users/videos', params: valid_params, headers: auth_header(user) }

      it 'renders video data', :dox do
        expect(response).to be_created
        expect(response).to match_schema(VideoSchema::Create)
      end
    end

    describe 'Fail' do
      context 'when no auth headers passed' do
        before { post '/api/v1/users/videos' }

        it 'renders error data', :dox do
          expect(response).to be_unauthorized
          expect(response).to match_schema(ErrorSchema::Unauthorized)
        end
      end

      context 'when invalid auth token passed' do
        before { post '/api/v1/users/videos', headers: { 'Authorization' => 'token' } }

        it 'renders error data', :dox do
          expect(response).to be_unauthorized
          expect(response).to match_schema(ErrorSchema::Unauthorized)
        end
      end
    end
  end

  describe 'GET #index' do
    include ApiDoc::V1::Users::Video::Index

    before do
      create(:video, user: user)
      create(:video, user: user, with_trimmed_file: true)
    end

    describe 'Success' do
      before { get '/api/v1/users/videos', headers: auth_header(user) }

      it 'renders all videos', :dox do
        expect(response).to be_ok
        expect(response).to match_schema(VideoSchema::Index)
      end
    end

    describe 'Fail' do
      context 'when no auth headers passed' do
        before { get '/api/v1/users/videos' }

        it 'renders error data', :dox do
          expect(response).to be_unauthorized
          expect(response).to match_schema(ErrorSchema::Unauthorized)
        end
      end

      context 'when invalid auth token passed' do
        before { get '/api/v1/users/videos', headers: { 'Authorization' => 'token' } }

        it 'renders error data', :dox do
          expect(response).to be_unauthorized
          expect(response).to match_schema(ErrorSchema::Unauthorized)
        end
      end
    end
  end
end
