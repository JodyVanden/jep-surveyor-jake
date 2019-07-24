class Account
  include Mongoid::Document
  field :name, type: String
  has_many :users
  has_many :surveys
  validates :name, presence: true
end
