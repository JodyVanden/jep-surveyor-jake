module Types
  class DeleteRatingQuestionResult < BaseUnion
    possible_types IdType, ObjectPersistedError, DocumentNotFoundError
    
    def self.resolve_type(object, _context)
      if object.is_a?(Mongoid::Errors::DocumentNotFound)
        DocumentNotFoundError
      elsif object.persisted?
        FailedCreateRatingQuestionResult 
      else
        IdType
      end
    end
  end
end