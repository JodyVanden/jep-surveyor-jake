module Types
  class CreateRatingQuestionResult < BaseUnion
    possible_types RatingQuestionType, FailedCreateRatingQuestionResult, MissingArgumentError
    
    def self.resolve_type(object, _context)
      if object.is_a?(Mongoid::Errors::Validations)
        MissingArgumentError
      elsif object.persisted?
        RatingQuestionType
      else
        FailedCreateRatingQuestionResult
      end
    end
  end
end