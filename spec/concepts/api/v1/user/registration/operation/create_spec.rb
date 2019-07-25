# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::User::Registration::Operation::Create do
  subject(:result) { described_class.call(params: params) }

  let(:valid_params) { attributes_for(:user) }
  let(:params) { {} }

  describe 'Success' do
    let(:params) { valid_params }

    it 'creates user' do
      expect { result }.to change(User, :count).from(0).to(1)

      expect(result[:model]).to be_persisted
      expect(result[:model]).to an_instance_of User
      expect(result).to be_success
    end
  end

  describe 'Fail' do
    context 'with empty keys' do
      let(:errors) do
        {
          email: [I18n.t('errors.filled?'), I18n.t('errors.unique_email?')],
          password: [
            I18n.t('errors.filled?'),
            I18n.t('errors.min_size?', num: Constants::PASSWORD_MIN_LENGTH),
            I18n.t('errors.max_size?', num: Constants::PASSWORD_MAX_LENGTH)
          ],
          password_confirmation: [I18n.t('errors.filled?')]
        }
      end

      it 'has validation errors' do
        expect(result).to be_failure
        expect(result['contract.default'].errors.messages).to match errors
      end
    end

    context 'with invalid password' do
      let(:params) { valid_params.merge(password: 'pass', password_confirmation: 'pass') }
      let(:errors) do
        {
          password: [
            I18n.t('errors.min_size?', num: Constants::PASSWORD_MIN_LENGTH),
            I18n.t('errors.max_size?', num: Constants::PASSWORD_MAX_LENGTH)
          ]
        }
      end

      it 'has validation errors' do
        expect(result).to be_failure
        expect(result['contract.default'].errors.messages).to match errors
      end
    end

    context 'with unconfirmed password' do
      let(:params) { valid_params.merge(password_confirmation: 'no') }
      let(:errors) { { password_confirmation: [I18n.t('errors.password_confirmation?')] } }

      it 'has validation errors' do
        expect(result).to be_failure
        expect(result['contract.default'].errors.messages).to match errors
      end
    end

    context 'with non unique email' do
      let(:user) { create(:user) }
      let(:params) { valid_params.merge(email: user.email) }
      let(:errors) { { email: [I18n.t('errors.unique_email?')] } }

      it 'has validation errors' do
        expect(result).to be_failure
        expect(result['contract.default'].errors.messages).to match errors
      end
    end
  end
end
