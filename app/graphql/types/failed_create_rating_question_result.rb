module Types
  class FailedCreateRatingQuestionResult < BaseObject
    field :errors, String, null: false

    def errors
      "IT DIDN'T WERK"
    end
  end
end