module Types
  class QueryType < Types::BaseObject
    field :rating_questions, [RatingQuestionType], null: false
    field :surveys, [SurveyType], null: false
    field :get_token_from_header, TokenType, null: false
    field :current_user, UserType, null: false

    def rating_questions
      RatingQuestion.all
    end

    def surveys
      Survey.all
    end

    def get_token_from_header
      puts context
      {token: context.to_hash[:token]}
    end

    def current_user
      token = context.to_hash[:token]
      payload = JWT.decode token, ENV["SECRET"], true, { algorithm: 'HS256' }
      id = payload[0]["id"]["$oid"]
      User.find(id)
    end
  end
end
