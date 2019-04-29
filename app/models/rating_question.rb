class RatingQuestion
  include Mongoid::Document

  field :title, type: String
  # field :survey_id, type: String
  validates :title, presence: true
  belongs_to :survey
end
