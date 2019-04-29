class Survey
  include Mongoid::Document
  field :name, type: String
  has_many :rating_questions
end
