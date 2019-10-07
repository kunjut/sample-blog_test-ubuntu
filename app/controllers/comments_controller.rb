class CommentsController < ApplicationController

  before_action :authenticate_user!, :only => [:create]

  def create
    @article = Article.find(params[:article_id])
    
    @comment = @article.comments.new(params_comment)
    @comment[:author] = current_user.username
    @comment.save
    
    redirect_to article_path(@article)
  end

  private

  def params_comment # метод для явного разрешения передачи параметров
    params.require(:comment).permit(:author, :body)
  end

end

