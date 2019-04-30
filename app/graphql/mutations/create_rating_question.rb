module Mutations
  class CreateRatingQuestion < Mutations::BaseMutation
    argument :title, String, required: true

    type Types::CreateRatingQuestionResult

    def resolve(title: nil)
      begin
        RatingQuestion.create!(title: title)
      rescue Mongoid::Errors::Validations => e
        puts "RESCUING #{e.class}"
        e
      end
    end
  end
end