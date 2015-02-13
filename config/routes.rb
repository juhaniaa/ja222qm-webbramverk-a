Rails.application.routes.draw do
  root 'users#index'
  
  resources :users
  
  post  "user/login"  =>  "users#login", as: :login
  get   "user/logout" =>  "users#logout", as: :logout
  get   "user/newkey" =>  "users#newkey", as: :newkey
  get   "user/remkey" =>  "users#remkey", as: :remkey
  
  get   "admin"  =>  "admins#index", as: :admin
  post  "admin/login" => "admins#login", as: :adlogin
  get  "admin/logout" => "admins#logout", as: :adlogout
  get   "admin/userkeys" => "admins#userkeys", as: :aduserkeys
  get  "admin/remove/:id" => "admins#removekey", as: :adremovekey

end




