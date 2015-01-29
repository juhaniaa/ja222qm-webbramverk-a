class UsersController < ApplicationController
  before_action :require_login, only: [:show]
  
  def index
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:userid] = @user.id
      redirect_to @user
    else
      render action: :new
    end
  end
  
  def show
    # kolla att användaren är rätt?
    #if session[:userid] === params[:id]
     # render "show"
    #else
     # redirect_to users_path
    #end
  end
  
  
  # Inloggningsmetoder
  
  def login
    u = User.find_by_email(params[:email])
    if u && u.authenticate(params[:password])
      session[:userid] = u.id
      redirect_to u
    else
      flash[:notice] = "Inloggningen misslyckades"
      redirect_to users_path
    end
  end
  
  
  def logout
    session[:userid] = nil
    redirect_to users_path, notice: "Du loggades ut"
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end  
end
