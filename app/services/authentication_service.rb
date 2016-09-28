class AuthenticationService
  def authenticate(username:, password:, user_agent:)
    user = User.find_by!(username: username)
    raise "Invalid password" unless user.authenticate(password)
    ApiToken.create(user: user, user_agent: user_agent)
  end

  def find_user_by_auth_token(auth_token)
    ApiToken.find_by(auth_token: auth_token).try(:user)
  end
end