class ArticlesController < ApplicationController
  
  def index
    @articles = Article.order 'id DESC'
  end

  def new
  end
  
  def create
    render plain: params[:article]
  end

end
