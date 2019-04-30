module Types
  class CreateSurveyResult < BaseUnion
    possible_types SurveyType, FailedCreateSurveyResult, MissingArgumentError
    
    def self.resolve_type(object, _context)
      if object.is_a?(Mongoid::Errors::Validations)
        MissingArgumentError
      elsif object.persisted?
        SurveyType
      else
        FailedCreateSurveyResult
      end
    end
  end
end