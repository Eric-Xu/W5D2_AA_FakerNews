class Article < ActiveRecord::Base
  attr_accessible :author_id, :body, :karma, :title, :url

  belongs_to :user
  has_many :comments
end
