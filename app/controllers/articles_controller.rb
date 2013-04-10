class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
    @article.comments.build
  end

  def create
    @article = Article.new(params[:article])
    @article.author_id = current_user.id
    @article.comments.each do |comment|
      comment.author_id = current_user.id
    end

    if @article.save
      flash.notice = "#{@article.title} created!"
      redirect_to article_url(@article)
    else
      flash.now[:error] = @article.errors.full_messages
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.assign_attributes(params[:article])
    if @article.save
      flash.notice = "#{@article.title} updated!"
      redirect_to article_url(@article)
    else
      flash.now[:error] = @article.errors.full_messages
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_url
  end
end
