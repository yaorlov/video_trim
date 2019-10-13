# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::User::Video::Operation::Index do
  subject(:result) { described_class.call(params: {}, current_user: user) }

  let(:user) { create :user }
  let!(:user_video) { create :video, user: user, with_trimmed_file: true }
  let!(:another_user_video) { create :video, with_trimmed_file: true }

  describe 'Success' do
    let(:params) { valid_params }

    it 'returns user\'s trimmed videos' do
      data = result[:model]

      expect(data).to include(user_video)
      expect(data).not_to include(another_user_video)
      expect(result).to be_success
    end
  end
end
