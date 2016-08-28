class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def new
  	@article = Article.new
  end

  def create
  	@article = Article.new
  	@article.title = params[:article][:title]
  	@article.body = params[:article][:body]
    @article.user_id = params[:article][:user_id]
  	@article.save
	redirect_to show_path(@article.id)
  end

  def show
  	@article = Article.find(params[:id])
  end

  def index
  	@articles = Article.all
  end

  def edit
 	@article = Article.find(params[:id])
  end

  def update
  	@article = Article.find(params[:id])
 	@article.title = params[:article][:title]
 	@article.body = params[:article][:body]
 	@article.save
 	redirect_to show_path(@article.id)
  end

  def delete
  	@article = Article.find(params[:id])
  	@article.destroy
  	redirect_to articles_index_path
  end


end




