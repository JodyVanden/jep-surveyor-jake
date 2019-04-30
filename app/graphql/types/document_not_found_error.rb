module Types
  class DocumentNotFoundError < Types::BaseObject
    field :errors, String, null: false

    def errors
      "No document with that ID was found."
    end
  end
end