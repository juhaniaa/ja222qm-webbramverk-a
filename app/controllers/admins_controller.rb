class AdminsController < ApplicationController
  before_action :require_admin, except: [:index, :login]
  
  def index # login page
    if session[:admin]      
      redirect_to aduserkeys_path      
    end
  end
  
  def userkeys # get all users and their api keys
    @Users = User.all
    #render "userkeys"
  end
  
  def removekey # post delete an api-key admin/removekey/:idofUser
    u = User.find(params[:id])
    u.apikey = nil
    u.save
    redirect_to aduserkeys_path
  end
  
  def login # post to log in    
    if params[:adminName] === "admin" && params[:adminPassword] === "admin"
      session[:admin] = true
      redirect_to aduserkeys_path
    else
      flash[:notice] = "Inloggningen misslyckades"
      redirect_to admin_path
    end
  end
  
  def logout # post to log out
    session[:admin] = nil
    redirect_to admin_path, notice: "Du loggades ut"
  end  
  
  private
  
  def require_admin   
    redirect_to admin_path, notice: "Måste logga in" unless session[:admin]
  end
  
end
