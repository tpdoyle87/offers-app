module RequestSpecHelper
  def valid_headers(user)
    user.create_new_auth_token
  end
end