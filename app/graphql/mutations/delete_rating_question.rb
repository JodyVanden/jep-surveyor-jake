module Mutations
  class DeleteRatingQuestion < Mutations::BaseMutation
    argument :id, ID, required: true

    type Types::DeleteRatingQuestionResult

    def resolve(id: nil)
      begin
        target_question = RatingQuestion.find(id)
        target_question.destroy
        return target_question
      rescue Mongoid::Errors::DocumentNotFound => e
        e
      end
    end
  end
end
