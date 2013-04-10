class Article < ActiveRecord::Base
  attr_accessible :author_id, :body, :karma, :title, :url, :comments_attributes
  validates :body, :title, :url, :author_id, :presence => true

  belongs_to :user
  has_many :comments, :inverse_of => :article
  accepts_nested_attributes_for :comments


end
