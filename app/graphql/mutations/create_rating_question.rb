module Mutations
  class CreateRatingQuestion < Mutations::BaseMutation
    argument :title, String, required: true

    type Types::CreateRatingQuestionResult

    def resolve(title: nil)
      RatingQuestion.create!(title: title)
    end
  end
end