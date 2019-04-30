class Survey
  include Mongoid::Document
  field :name, type: String
  validates :name, presence: true
  has_many :rating_questions
end
