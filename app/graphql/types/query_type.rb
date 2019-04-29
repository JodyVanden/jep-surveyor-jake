module Types
  class QueryType < Types::BaseObject
    field :rating_questions, [RatingQuestionType], null: false
    field :surveys, [SurveyType], null: false

    def rating_questions
      RatingQuestion.all
    end

    def surveys
      Survey.all
    end
  end
end
