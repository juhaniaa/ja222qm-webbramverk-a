class UsersController < ApplicationController
  def index
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:userid] = @user.id
      redirect_to user_path
    else
      render action: :new
    end
  end
  
  def show
    
  end
  
  
  # Inloggningsmetoder
  
  def login
    u = User.find_by_email(params[:email])
    if u && u.authenticate(params[:password])
      session[:userid] = u.id
      redirect_to user_path
    else
      flash[:notice] = "Inloggningen misslyckades"
      redirect_to users_path
    end
  end
  
  def logout
  end
  
  private
  
  def user_params
    
  end
  
end
