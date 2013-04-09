class User < ActiveRecord::Base
  attr_accessible :karma, :remember_token, :username

  has_many :articles
  has_many :comments
end
