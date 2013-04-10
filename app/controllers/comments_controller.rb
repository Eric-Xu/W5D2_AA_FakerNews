class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
  end

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.author_id = current_user.id
    @comment.article_id = params[:comment][:article_id]
    #@comment.parent_comment_id = params[:article_id]
    if @comment.save
      flash.notice = "New comment created!"
      redirect_to article_url(@comment.article)
    else
      flash.now[:error] = @comment.errors.full_messages
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.assign_attributes(params[:comment])
    if @comment.save
      flash.notice = "Comment updated!"
      redirect_to comment_url(@comment)
    else
      flash.now[:error] = @comment.errors.full_messages
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_url
  end
end
