module Types
  class QueryType < Types::BaseObject
    field :accounts, [AccountType], null: false
    field :surveys, [SurveyType], null: false
    field :rating_questions, [RatingQuestionType], null: false
    field :get_token_from_header, TokenType, null: false
    field :current_user, UserType, null: false

    def accounts
      Account.all
    end

    def surveys
      p "CURRENT USER!!!"
      current_user.account.surveys
      # Survey.all
    end

    def rating_questions
      RatingQuestion.all
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
