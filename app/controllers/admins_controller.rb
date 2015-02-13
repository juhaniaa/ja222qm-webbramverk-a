class AdminsController < ApplicationController
  before_action :require_admin, except: [:index, :login]
  
  def index # login page
    if session[:admin]      
      redirect_to aduserkeys_path      
    end
  end
  
  # visa alla användare och deras api-nyckel om de har en
  def userkeys 
    @users = User.all    
  end
  
  # post ta bort en användares api-nyckel admin/removekey/:idofUser
  def removekey     
    @user = User.find_by_id(params[:id])
    if @user.update_attribute(:apikey,nil)
      flash[:notice] = "Nyckeln togs bort"
    else
      flash[:notice] = "Fel uppstod"
    end
    redirect_to aduserkeys_path
  end
  
  # post logga in admin 
  def login 
    if params[:adminName] === "admin" && params[:adminPassword] === "admin"
      session[:admin] = true
      redirect_to aduserkeys_path
    else
      flash[:notice] = "Inloggningen misslyckades"
      redirect_to admin_path
    end
  end
  
  # post logga ut admin
  def logout 
    session[:admin] = nil
    redirect_to admin_path, notice: "Du loggades ut"
  end  
  
  private
  
  # kolla att inloggad är admin
  def require_admin   
    redirect_to admin_path, notice: "Måste logga in" unless session[:admin]
  end
  
end
