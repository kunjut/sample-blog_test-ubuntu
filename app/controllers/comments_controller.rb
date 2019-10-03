class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @article.comments.create(params_comment)

    redirect_to article_path(@article)
  end

  private

  def params_comment # метод для явного разрешения передачи параметров
    params.require(:comment).permit(:author, :body)
  end

end

