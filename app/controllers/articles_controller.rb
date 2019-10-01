class ArticlesController < ApplicationController
  
  def index
    @articles = Article.order 'id DESC'
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    
    @article = Article.find(params[:id])    # запрос в БД записи для Article совпадающей по :id из маршрута
 
    @article.update(                        # обновление @article
      title: params[:article][:title],      # передача хэша с актуальными параметрами
      content: params[:article][:content]
    )
    
    redirect_to article_path                # перенаправление после обновления на /article/:id
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create                                # создание новой записи: create и params_article 
    @article = Article.new params_article   # создание в памяти, записи для Article (c разрешением)
    
    if @article.valid?                      # если валидация пройдена
      @article.save                         # сохранение записи в БД
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
