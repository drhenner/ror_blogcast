class User < ActiveRecord::Base
  validates_presence_of :name, :initials, :login, :email, :password
  
  acts_as_authentic
  attr_accessible :name, :initials, :login, :email, :password, :password_confirmation
  
  def self.find_by_login_or_email(login)
    User.find_by_login(login) || User.find_by_email(login)
  end
end