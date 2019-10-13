# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::User::Request::Operation::Index do
  subject(:result) { described_class.call(params: {}, current_user: user) }

  let(:user) { create :user }
  let!(:user_request) { create :request, user: user }
  let!(:another_user_request) { create :request }

  describe 'Success' do
    let(:params) { valid_params }

    it 'returns user\'s requests' do
      data = result[:model]

      expect(data).to include(user_request)
      expect(data).not_to include(another_user_request)
      expect(result).to be_success
    end
  end
end
