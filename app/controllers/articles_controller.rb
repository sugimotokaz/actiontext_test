class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.build(article_params)
    if @article.save
      redirect_to articles_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to articles_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
