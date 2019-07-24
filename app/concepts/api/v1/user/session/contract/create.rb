# frozen_string_literal: true

module Api::V1::User::Session::Contract
  class Create < Reform::Form
    include Dry

    property :email
    property :password

    validation :default do
      configure do
        option :form
      end

      required(:email).filled(format?: URI::MailTo::EMAIL_REGEXP)
      required(:password).filled(:str?, min_size?: Constants::PASSWORD_MIN_LENGTH,
                                        max_size?: Constants::PASSWORD_MAX_LENGTH)
    end
  end
end
