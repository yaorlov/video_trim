# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::User::Video::Operation::Trim do
  subject(:result) { described_class.call(params: params) }

  let!(:request) { create(:request) }
  let(:valid_params) { { request_id: request.id } }
  let(:params) { {} }

  before do
    # rubocop:disable RSpec/AnyInstance
    allow_any_instance_of(FFMPEG::Movie).to receive(:transcode).and_return(
      FFMPEG::Movie.new(Tempfile.new(['transcoded', '.mp4'], binmode: true).path)
    )
    # rubocop:enable RSpec/AnyInstance
  end

  describe 'Success' do
    let(:params) { valid_params }

    it 'updates video with trimmed file' do
      expect { result }.to change { request.reload.video.trimmed_file }.from(nil).and \
        change(request, :status).from(Request::STATUSES[:scheduled]).to(Request::STATUSES[:done])

      expect(result).to be_success
    end
  end

  describe 'Fail' do
    context 'with empty keys' do
      it 'ends with failure status' do
        expect(result).to be_failure
      end
    end

    context 'when processing fails' do
      let(:params) { valid_params }

      before do
        # rubocop:disable RSpec/AnyInstance
        allow_any_instance_of(FFMPEG::Movie).to receive(:transcode).and_raise(FFMPEG::Error)
        # rubocop:enable RSpec/AnyInstance
      end

      it 'ends with failure status' do
        expect { result }.to avoid_changing { request.reload.video.trimmed_file }.and \
          change(request, :status).from(Request::STATUSES[:scheduled]).to(Request::STATUSES[:failed])

        expect(result).to be_failure
      end
    end
  end
end
