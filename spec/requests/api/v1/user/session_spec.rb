# frozen_string_literal: true

require 'rails_helper'

describe 'Api::V1::Users::Session', type: :request do
  include ApiDoc::V1::Users::Session::Api

  describe 'POST #create' do
    include ApiDoc::V1::Users::Session::Create

    describe 'Success' do
      let(:user) { create :user }
      let(:valid_params) do
        {
          email: user.email,
          password: user.password
        }
      end

      before { post '/api/v1/users/session', params: valid_params }

      it 'renders auth tokens', :dox do
        expect(response).to be_created
        expect(response).to match_schema(SessionSchema::Create)
      end
    end
  end
end
