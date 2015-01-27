class User < ActiveRecord::Base
  has_secure_password
  
  validates :email,
            presence: {message: "Du måste ange e-post"},
            uniqueness: true
  
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                      presence: {message: "Felaktig e-post"}
end
