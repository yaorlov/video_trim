# frozen_string_literal: true

require 'rails_helper'

describe 'Api::V1::Users::Request', type: :request do
  include ApiDoc::V1::Users::Request::Api

  let(:user) { create :user }

  before do
    create_list(:request, 2, user: user)
  end

  describe 'GET #index' do
    include ApiDoc::V1::Users::Request::Index

    describe 'Success' do
      before { get '/api/v1/users/requests', headers: auth_header(user) }

      it 'renders all requests', :dox do
        expect(response).to be_ok
        expect(response).to match_schema(RequestSchema::Index)
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

  describe 'POST #restart' do
    include ApiDoc::V1::Users::Request::Restart

    let(:failed_request) { create :request, user: user, status: Request::STATUSES[:failed] }

    describe 'Success' do
      before { post "/api/v1/users/requests/#{failed_request.id}/restart", headers: auth_header(user) }

      it 'renders request data', :dox do
        expect(response).to be_ok
        expect(response).to match_schema(RequestSchema::Restart)
      end
    end

    describe 'Fail' do
      context 'when no auth headers passed' do
        before { post "/api/v1/users/requests/#{failed_request.id}/restart" }

        it 'renders error data', :dox do
          expect(response).to be_unauthorized
          expect(response).to match_schema(ErrorSchema::Unauthorized)
        end
      end

      context 'when invalid auth token passed' do
        before { post "/api/v1/users/requests/#{failed_request.id}/restart", headers: { 'Authorization' => 'token' } }

        it 'renders error data', :dox do
          expect(response).to be_unauthorized
          expect(response).to match_schema(ErrorSchema::Unauthorized)
        end
      end

      context 'when request does not exist' do
        before { post "/api/v1/users/requests/#{BSON::ObjectId.new}/restart", headers: auth_header(user) }

        it 'renders error data', :dox do
          expect(response).to be_not_found
        end
      end
    end
  end
end
