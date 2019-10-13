# frozen_string_literal: true

RSpec.describe Request, type: :model do
  it { is_expected.to be_mongoid_document }

  it { is_expected.to have_field(:status).of_type(Integer) }
  it { is_expected.to have_field(:trimming_start_time).of_type(Integer) }
  it { is_expected.to have_timestamps }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:video) }
end
