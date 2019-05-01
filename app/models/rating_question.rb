class RatingQuestion
  include Mongoid::Document

  field :title, type: String
  belongs_to :survey, optional: true
  validates :title, presence: true
  validates :survey, presence: true
end
