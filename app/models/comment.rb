class Comment < ActiveRecord::Base
  attr_accessible :article_id, :author_id, :body, :parent_comment_id

  validates :body, :author_id, :presence => true

  belongs_to :article, :inverse_of => :comments
  belongs_to :user

  belongs_to :parent_comment, :class_name => "Comment"
  has_many :child_comments, :class_name => "Comment", :foreign_key => :parent_comment_id

  has_many :comment_ancestors, :class_name => "CommentAncestry", :foreign_key => :descendant_id
  has_many :comment_descendants, :class_name => "CommentAncestry", :foreign_key => :ancestor_id

  has_many :ancestors, :through => :comment_ancestors
  has_many :descendants, :through => :comment_descendants
end
