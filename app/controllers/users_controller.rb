class UsersController < ApplicationController
  before_action :require_login, except: [:index, :new, :create, :login]
  
  def index
    if session[:userid]
      u = User.find(session[:userid])
      if u
        redirect_to u
      end
    end
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
    if session[:userid].to_s === params[:id]
      render "show"
    else
      redirect_to users_path
    end
  end
  
  # Apinyckelsmetoder
  
  def newkey    
    u = User.find(session[:userid])
    u.apikey = SecureRandom.hex
    u.save    
    redirect_to u
  end
  
  def remkey
    u = User.find(session[:userid])
    u.apikey = nil
    u.save
    redirect_to u
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
