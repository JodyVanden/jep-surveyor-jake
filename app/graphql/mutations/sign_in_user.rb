require 'jwt'
module Mutations
  class SignInUser < BaseMutation
    null true

    argument :email, Types::AuthProviderSignupData, required: false

    field :token, String, null: true
    field :user, Types::UserType, null: true

    def resolve(email: nil)
      # basic validation
      return unless email

      user = User.find_by email: email[:email]

      # ensures we have the correct user
      return unless user
      return unless user.authenticate(email[:password])

      payload = {
        email: user.email,
        id: user.id
      }

      token = JWT.encode payload, ENV["SECRET"], 'HS256'

      puts "SIGNED TOKEN"
      puts token
      puts "DECRYPTED TOKEN"
      puts JWT.decode token, ENV["SECRET"], true, { algorithm: 'HS256' }
      puts "ENV VARIABLE"
      puts ENV["SECRET"]

      { user: user, token: token }
    end
  end
end