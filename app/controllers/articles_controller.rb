class ArticlesController < ApplicationController
  
  def index
    @articles = Article.order 'id DESC'
  end

  def new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new params_article
    @article.save
  end

  private

  def params_article
    params.require(:article).permit(:title, :content)
  end

end
