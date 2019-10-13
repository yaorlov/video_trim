# frozen_string_literal: true

RSpec.describe Video, type: :model do
  it { is_expected.to be_mongoid_document }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_one(:request).with_dependent(:destroy) }

  it { is_expected.to have_field(:name).of_type(String) }
  it { is_expected.to have_field(:duration).of_type(Integer) }
  it { is_expected.to have_field(:trimmed_file_data).of_type(String) }
  it { is_expected.to have_field(:source_file_data).of_type(String) }
end
