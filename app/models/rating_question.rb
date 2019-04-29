class RatingQuestion
  include Mongoid::Document

  field :title, type: String
  belongs_to :survey, optional: true
  # field :survey_id, type: String
  validates :title, presence: true
end
