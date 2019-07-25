# frozen_string_literal: true

module ErrorSchema
  Unauthorized = Dry::Validation.Schema do
    input :hash?

    required(:errors).each do
      schema do
        required(:detail).filled(:str?)
        required(:source).value(:hash?)
      end
    end
    required(:jsonapi).schema do
      required(:version).filled(:str?)
    end
  end
end
