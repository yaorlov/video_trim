# frozen_string_literal: true

module VideoSchema
  Create = Dry::Validation.Schema do
    input :hash?

    required(:data).schema do
      required(:id).filled(:str?)
      required(:type).filled(:str?)
      required(:attributes).schema do
        required(:name).filled(:str?)
      end
      required(:relationships).schema do
        required(:user).schema do
          required(:meta).schema do
            required(:included).filled(:bool?)
          end
        end
        required(:request).schema do
          required(:meta).schema do
            required(:included).filled(:bool?)
          end
        end
      end
    end
    required(:jsonapi).schema do
      required(:version).filled(:str?)
    end
  end

  Index = Dry::Validation.Schema do
    input :hash?

    required(:data).each do
      schema do
        required(:id).filled(:str?)
        required(:type).filled(:str?)
        required(:attributes).schema do
          required(:duration).filled(:str?)
          required(:url).filled(:str?)
        end
        required(:relationships).schema do
          required(:user).schema do
            required(:meta).schema do
              required(:included).filled(:bool?)
            end
          end
          required(:request).schema do
            required(:meta).schema do
              required(:included).filled(:bool?)
            end
          end
        end
      end
    end
    required(:jsonapi).schema do
      required(:version).filled(:str?)
    end
  end
end
