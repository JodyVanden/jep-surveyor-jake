module Types
  class RatingQuestionType < BaseObject
    field :title, String, null: false
    field :tag, String, null: false
    field :id, ID, null: false
    field :survey, SurveyType, null: true
  end
end