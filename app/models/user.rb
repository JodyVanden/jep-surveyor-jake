class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  has_secure_password

  field :name, type: String
  field :email, type: String
  field :password_digest, type: String
  belongs_to :account
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :account, presence: true
  validates :password_digest, presence: true
end