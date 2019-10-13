# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable RSpec/FilePath
describe TrimVideoWorker, type: :worker do
  let(:worker_param) { BSON::ObjectId.new }

  before do
    allow(Api::V1::User::Video::Operation::Trim).to receive(:call)
  end

  describe 'worker queing' do
    it 'pushes job to queue' do
      expect do
        TrimVideoWorker.perform_async(worker_param)
      end.to change(TrimVideoWorker.jobs, :size).by(1)
    end
  end

  describe 'worker' do
    it 'calls Api::V1::User::Video::Operation::Trim operation with request id' do
      TrimVideoWorker.new.perform(worker_param)

      expect(Api::V1::User::Video::Operation::Trim).to have_received(:call)\
        .with(params: { request_id: worker_param }).once
    end
  end
end
# rubocop:enable RSpec/FilePath
