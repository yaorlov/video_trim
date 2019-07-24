# frozen_string_literal: true

class Api::V1::User::Video::Contract::Create < Reform::Form
  feature Reform::Form::Dry

  property :name
  property :source_file
  property :trimming_start_time, virtual: true
  property :trimming_end_time, virtual: true

  validation do
    required(:name).filled(:str?)
    required(:source_file).filled
    required(:trimming_start_time).filled(:int?, gteq?: 0)
    required(:trimming_end_time).filled(:int?, gt?: 0)
  end
end
