module Types
  class ObjectPersistedError < Types::BaseObject
    field :errors, String, null: false

    def errors
      "document found, but not deleted..."
    end
  end
end