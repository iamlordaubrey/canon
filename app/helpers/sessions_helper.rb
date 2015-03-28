module SessionsHelper
  # def sign_in(user)
  #   cookies.permanent[:remember_token] = user.remember_token
  #   self.current_user = user
  # end
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !current_user.nil?
  end

  def authenticate_user
    unless signed_in?
      redirect_to root_path, notice: "Please sign in."
    end
  end
end
