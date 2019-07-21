# frozen_string_literal: true

require 'rails_helper'

describe 'Api::V1::Users::Registration', type: :request do
  include ApiDoc::V1::Users::Registration::Api

  describe 'POST #create' do
    include ApiDoc::V1::Users::Registration::Create

    describe 'Success' do
      let(:valid_params) do
        {
          email: FFaker::Internet.email,
          password: '!1password',
          password_confirmation: '!1password'
        }
      end

      before { post '/api/v1/users/registration', params: valid_params }

      it 'renders created user', :dox do
        expect(response).to be_created
        expect(response).to match_schema(RegistrationSchema::Success)
      end
    end
  end
end
