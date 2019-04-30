module Types
  class MissingArgumentError < Types::BaseObject
    field :errors, String, null: false

    def errors
      "Missing an argument..."
    end
  end
end