module Types
  class AccountType < BaseObject
    field :name, String, null: false
    field :id, ID, null: false
    field :surveys, [SurveyType], null: true
    field :users, [UserType], null: true
  end
end
