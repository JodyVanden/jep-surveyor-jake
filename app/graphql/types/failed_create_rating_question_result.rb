module Types
  class FailedCreateRatingQuestionResult < BaseObject
    field :errors, [String], null: false

    def errors
      object.errors.full_messages
    end
  end
end