module SessionsHelper
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update(remember_token: User.encrypt(remember_token))
    @current_user  = user
  end

  def current_user
    @current_user ||= User.find_by(remember_token: User.encrypt(cookies[:remember_token]))
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    current_user.update(remember_token: User.encrypt(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end
end