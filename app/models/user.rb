# frozen_string_literal: true

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  has_many :videos, dependent: :destroy
  has_many :requests, dependent: :destroy

  field :email, type: String
  field :password_digest, type: String

  has_secure_password
end
