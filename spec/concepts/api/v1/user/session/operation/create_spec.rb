# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::User::Session::Operation::Create do
  subject(:result) { described_class.call(params: params) }

  let!(:user) { create :user }
  let(:valid_params) { { email: user.email, password: user.password } }
  let(:params) { {} }

  describe 'Success' do
    let(:params) { valid_params }

    it 'returns access token' do
      expect(result[:access_token]).to be_instance_of String
      expect(result).to be_success
    end
  end

  describe 'Fail' do
    context 'with empty keys' do
      it 'has validation errors' do
        expect(result).to be_failure
      end
    end

    context 'with invalid password' do
      let(:params) { valid_params.merge(password: 'invalid_password') }

      it 'has validation errors' do
        expect(result).to be_failure
      end
    end

    context 'with non existing email' do
      let(:user) { create(:user) }
      let(:params) { valid_params.merge(email: 'test@test.com') }

      it 'has validation errors' do
        expect(result).to be_failure
      end
    end
  end
end
