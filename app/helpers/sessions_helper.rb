module SessionsHelper
  def log_in(username, password)
    user = User.find_by_username(username)
    if user && user.password == password
      user.remember_token = generate_token
      user.save!

      session[:remember_token] = user.remember_token
      true
    else
      false
    end
  end

  def log_out
    current_user.remember_token = nil
    current_user.save!

    session[:remember_token] = nil
  end

  def current_user
    return nil if session[:remember_token].nil?
    @current_user ||= User.find_by_remember_token(session[:remember_token])
  end

  def generate_token
    SecureRandom.hex(16)
  end

  def logged_in?
    not current_user.nil?
  end
end
