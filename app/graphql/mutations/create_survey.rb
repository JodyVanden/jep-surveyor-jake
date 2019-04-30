module Mutations
  class CreateSurvey < Mutations::BaseMutation
    argument :name, String, required: true

    type Types::CreateSurveyResult

    def resolve(name: nil)
      begin
        Survey.create!(name: name)
      rescue Mongoid::Errors::Validations => e
        puts "RESCUING #{e.class}"
        e
      end
    end
  end
end