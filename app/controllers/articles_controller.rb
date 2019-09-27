class ArticlesController < ApplicationController
  def index
    @articles = Article.order 'id DESC'
  end
end
