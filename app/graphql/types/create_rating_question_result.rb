module Types
  class CreateRatingQuestionResult < BaseUnion
    possible_types RatingQuestionType, FailedCreateRatingQuestionResult
    
    def self.resolve_type(object, _context)
      if object.persisted?
        RatingQuestionType
      else
        FailedCreateRatingQuestionResult
      end
    end
  end
end