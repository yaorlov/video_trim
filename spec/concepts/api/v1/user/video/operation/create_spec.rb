# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::User::Video::Operation::Create do
  subject(:result) { described_class.call(params: params, current_user: user) }

  let(:valid_params) { attributes_for(:video).merge(trimming_start_time: rand(0..2)) }
  let(:params) { {} }
  let(:user) { create :user }

  describe 'Success' do
    let(:params) { valid_params }

    # rubocop:disable RSpec/ExampleLength
    it 'creates video and trimming request' do
      expect { result }.to change(Video, :count).from(0).to(1).and(
        change(Request, :count).from(0).to(1)
      ).and(
        change { TrimVideoWorker.jobs.size }.by(1)
      )

      expect(result[:model]).to be_persisted
      expect(result[:model]).to an_instance_of Video
      expect(result).to be_success
    end
    # rubocop:enable RSpec/ExampleLength
  end

  describe 'Fail' do
    context 'with empty keys' do
      let(:errors) do
        {
          name: [I18n.t('errors.filled?')],
          source_file: [I18n.t('errors.filled?')],
          trimming_start_time: [I18n.t('errors.filled?'), I18n.t('errors.gteq?', num: 0)],
          duration: [I18n.t('errors.filled?'), I18n.t('errors.gt?', num: 0)]
        }
      end

      it 'has validation errors' do
        expect(result).to be_failure
        expect(result['contract.default'].errors.messages).to match errors
      end
    end

    context 'with trimming_start_time below 0' do
      let(:params) { valid_params.merge(trimming_start_time: -1) }
      let(:errors) do
        {
          trimming_start_time: [I18n.t('errors.gteq?', num: 0)]
        }
      end

      it 'has validation errors' do
        expect(result).to be_failure
        expect(result['contract.default'].errors.messages).to match errors
      end
    end

    context 'with duration below 1' do
      let(:params) { valid_params.merge(duration: 0) }
      let(:errors) do
        {
          duration: [I18n.t('errors.gt?', num: 0)]
        }
      end

      it 'has validation errors' do
        expect(result).to be_failure
        expect(result['contract.default'].errors.messages).to match errors
      end
    end
  end
end
