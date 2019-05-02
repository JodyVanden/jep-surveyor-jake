module Mutations
  class CreateUser < Mutations::BaseMutation
    argument :name, String, required: true
    argument :auth_provider, Types::AuthProviderSignupData, required: false

    type Types::UserType

    def resolve(name: nil, auth_provider: nil)
      User.create!(
        name: name,
        email: auth_provider[:email],
        password: auth_provider[:password]
      )
    end
  end
end