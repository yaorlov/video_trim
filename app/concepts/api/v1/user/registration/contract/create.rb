# frozen_string_literal: true

module Api::V1::User::Registration::Contract
  class Create < Reform::Form
    include Dry

    property :email
    property :password
    property :password_confirmation

    validation :default do
      configure do
        def unique_email?(email)
          User.where(email: email).empty?
        end
      end

      required(:email).filled(:unique_email?, format?: URI::MailTo::EMAIL_REGEXP)
      required(:password).filled(:str?, min_size?: Constants::PASSWORD_MIN_LENGTH,
                                        max_size?: Constants::PASSWORD_MAX_LENGTH)
      required(:password_confirmation).filled(:str?)

      validate(password_confirmation?: %i[password password_confirmation]) do |password, password_confirmation|
        password == password_confirmation
      end
    end
  end
end
