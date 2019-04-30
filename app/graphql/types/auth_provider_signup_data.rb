module Types
  class AuthProviderSignupData < Types::BaseInputObject
    argument :email, String, required: false
    argument :password, String, required: true
  end
end