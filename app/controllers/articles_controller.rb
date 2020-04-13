class ArticlesController < ApplicationController
  load_and_authorize_resource
  http_basic_authenticate_with name: 'admin', password:'gothilla', except: [:index, :show]
  before_filter :authenticate_admin!, excpet: [:index, :show]
  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def create
    @article = Article.new(article_params)  
    @article.User_id = current_admin.id  
    if(@article.save)
      redirect_to @article
    else
      render 'new'
    end
  end


  def update
    @article = Article.find(params[:id])
   
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
   
    redirect_to articles_path
  end
   
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

end

