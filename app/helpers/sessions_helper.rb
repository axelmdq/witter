module SessionsHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate
    unless current_user
      flash[:error] = "Por favor, ingrese al sistema"
      redirect_to root_path
    end
  end

end
