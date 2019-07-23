# frozen_string_literal: true

module SessionSchema
  Success = Dry::Validation.Schema do
    input :hash?

    required(:data).schema do
      required(:id).filled(:str?)
      required(:type).filled(:str?)
      required(:attributes).schema do
        required(:access).filled(:str?)
      end
    end
    required(:jsonapi).schema do
      required(:version).filled(:str?)
    end
  end
end
