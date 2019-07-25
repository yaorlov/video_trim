# frozen_string_literal: true

module RequestSchema
  Index = Dry::Validation.Schema do
    input :hash?

    required(:data).each do
      schema do
        required(:id).filled(:str?)
        required(:type).filled(:str?)
        required(:attributes).schema do
          required(:status).filled(:str?)
        end
        required(:relationships).schema do
          required(:user).schema do
            required(:meta).schema do
              required(:included).filled(:bool?)
            end
          end
          required(:video).schema do
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

  Restart = Dry::Validation.Schema do
    input :hash?

    required(:data).schema do
      required(:id).filled(:str?)
      required(:type).filled(:str?)
      required(:attributes).schema do
        required(:status).filled(:str?)
      end
      required(:relationships).schema do
        required(:user).schema do
          required(:meta).schema do
            required(:included).filled(:bool?)
          end
        end
        required(:video).schema do
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
end
