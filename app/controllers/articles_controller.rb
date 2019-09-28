class ArticlesController < ApplicationController
  
  def index
    @articles = Article.order 'id DESC'
  end

  def new
  end
  
end
