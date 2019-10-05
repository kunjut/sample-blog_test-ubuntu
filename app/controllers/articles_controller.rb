class ArticlesController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @articles = Article.order 'id DESC'
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path 
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update   
    @article = Article.find(params[:id])    # запрос в БД записи для Article совпадающей по :id из маршрута
 
    if @article.update(params_article)      # если обновление @article удалось
      redirect_to @article                  # перенаправление после обновления на /article/:id
    else
      render action: 'edit'
    end
  end

  def new
  end

  def create                                # создание новой записи: create и params_article 
    @article = Article.new params_article   # создание в памяти, записи для Article (c разрешением)
    
    if @article.save                        # сохранилось? значит валид-я пройдена, .save сам запускает ее
      redirect_to @article                  # редирект на '/articles' #show
    else                                    
      render action: 'new'                  # иначе вывод экшена 'new' (его вида)
    end                           
  end

  private                                   # все что ниже не доступно из вне

  def params_article                        # метод для явного разрешения передачи параметров
    params.require(:article).permit(:title, :content)
  end

end
