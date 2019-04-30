class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  has_secure_password

  field :name, type: String
  field :email, type: String
  field :password_digest, type: String
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end