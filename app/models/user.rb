class User < ActiveRecord::Base
  attr_accessible :email, :password, :username
  validates :username, :presence => true, :uniqueness => true
  validates :email, :uniqueness => true
end
