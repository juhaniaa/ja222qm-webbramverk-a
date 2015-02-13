class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
  
  # hämta ut användare från sessionen
  def current_user
    @current_user ||= User.find(session[:userid]) if session[:userid]
  end
  
  # se att användaren är inloggad
  def require_login
    if current_user.nil? then
      redirect_to users_path, notice: "Måste logga in"
    end
  end
  
end
