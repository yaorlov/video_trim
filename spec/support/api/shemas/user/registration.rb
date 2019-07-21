# frozen_string_literal: true

module RegistrationSchema
  Success = Dry::Validation.Schema do
    input :hash?

    required(:data).schema do
      required(:id).filled(:str?)
      required(:type).filled(:str?)
      required(:attributes).schema do
        required(:email).filled(:str?)
      end
    end
    required(:jsonapi).schema do
      required(:version).filled(:str?)
    end
  end
end
