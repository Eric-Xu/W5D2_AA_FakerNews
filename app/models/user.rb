class User < ActiveRecord::Base
  attr_accessible :karma, :remember_token, :username, :email, :password, :about

  validates :username, :email, :password, :presence => true

  has_many :articles, :foreign_key => :author_id
  has_many :comments, :foreign_key => :author_id
end
