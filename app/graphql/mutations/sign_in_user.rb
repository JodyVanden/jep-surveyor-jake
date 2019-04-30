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

      # use Ruby on Rails - ActiveSupport::MessageEncryptor, to build a token
      puts "WEIRD CRED THINGS"
      puts Rails.application.credentials
      # crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      len   = ActiveSupport::MessageEncryptor.key_len
      salt  = SecureRandom.random_bytes(len)
      key = ActiveSupport::KeyGenerator.new('password').generate_key(salt, len)
      crypt = ActiveSupport::MessageEncryptor.new(key)
      token = crypt.encrypt_and_sign("user-id:#{ user.id }")

      { user: user, token: token }
    end
  end
end