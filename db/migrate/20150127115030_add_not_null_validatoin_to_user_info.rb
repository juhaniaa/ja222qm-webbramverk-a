class AddNotNullValidatoinToUserInfo < ActiveRecord::Migration
  def change    
    change_column_null :users, :password, false
    change_column_null :users, :email, false    
  end
end
