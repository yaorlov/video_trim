# frozen_string_literal: true

RSpec.describe User, type: :model do
  it { is_expected.to be_mongoid_document }

  it { is_expected.to have_many(:videos).with_dependent(:destroy) }
  it { is_expected.to have_many(:requests).with_dependent(:destroy) }

  it { is_expected.to have_field(:email).of_type(String) }
  it { is_expected.to have_field(:password_digest).of_type(String) }
  it { is_expected.to have_timestamps }
end
