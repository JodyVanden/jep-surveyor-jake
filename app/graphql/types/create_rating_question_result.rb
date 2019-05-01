module Types
  class CreateRatingQuestionResult < BaseUnion
    possible_types RatingQuestionType, FailedCreateRatingQuestionResult, MissingArgumentError, DocumentNotFoundError
    
    def self.resolve_type(object, _context)
      if object.is_a?(Mongoid::Errors::Validations)
        MissingArgumentError
      elsif object.is_a?(Mongoid::Errors::DocumentNotFound)
        DocumentNotFoundError
      elsif object.persisted?
        RatingQuestionType
      else
        FailedCreateRatingQuestionResult
      end
    end
  end
end