module Mutations
  # class CreateUser < BaseMutation
  class CreateUser < Mutations::BaseMutation
    # often we will need input types for specific mutation
    # in those cases we can define those input types in the mutation class itself
    # class AuthProviderSignupData < Types::BaseInputObject
    #   argument :email, String, required: false
    #   argument :password, String, required: true
    # end

    argument :name, String, required: true
    argument :auth_provider, Types::AuthProviderSignupData, required: false

    type Types::UserType

    def resolve(name: nil, auth_provider: nil)
      User.create!(
        name: name,
        # email: auth_provider&.[](:email)&.[](:email),
        # password: auth_provider&.[](:email)&.[](:password)
        email: auth_provider[:email],
        password: auth_provider[:password]
      )
    end
  end
end