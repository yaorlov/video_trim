# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable RSpec/FilePath
describe TrimVideoWorker, type: :worker do
  let(:params) { BSON::ObjectId.new }

  before do
    allow(Api::V1::User::Video::Operation::Trim).to receive(:call)
  end

  describe 'worker queing' do
    it 'pushes job to queue' do
      expect do
        TrimVideoWorker.perform_async(params)
      end.to change(TrimVideoWorker.jobs, :size).by(1)
    end
  end

  describe 'worker' do
    it 'calls Api::V1::User::Video::Operation::Trim operation with request id' do
      TrimVideoWorker.new.perform(params)

      expect(Api::V1::User::Video::Operation::Trim).to have_received(:call).with(request_id: params).once
    end
  end
end
# rubocop:enable RSpec/FilePath
