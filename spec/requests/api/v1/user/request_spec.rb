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
        # TODO: RequestSchema::Index ?
        expect(response).to match_schema(RequestSchema::Success)
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
