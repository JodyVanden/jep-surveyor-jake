module Mutations
  class CreateRatingQuestion < Mutations::BaseMutation
    argument :title, String, required: true
    argument :survey_id, ID, required: true

    type Types::CreateRatingQuestionResult

    def resolve(title: nil, survey_id: nil)
      begin
        RatingQuestion.create!(title: title, survey: Survey.find(survey_id))
      rescue Mongoid::Errors::Validations => e
        puts "RESCUING #{e.class}"
        e
      rescue Mongoid::Errors::DocumentNotFound => e
        e
      end
    end
  end
end