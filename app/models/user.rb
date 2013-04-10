class User < ActiveRecord::Base
  attr_accessible :karma, :remember_token, :username, :email, :password, :about

  validates :username, :password, :presence => true
  validates :username, :uniqueness => true

  has_many :articles, :foreign_key => :author_id
  has_many :comments, :foreign_key => :author_id
end
