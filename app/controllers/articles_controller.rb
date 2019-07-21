class ArticlesController < ApplicationController
  before_action :set_article, only: [ :show, :edit, :update ]

  def index #GET
    @articles = Article.all
  end

  def new # GET
    @article  = Article.new
  end
  
  def create # POST
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
  
  def show # GET
  end

  def edit # GET
  end

  def update # POST
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
  
  private
  
  def article_params
    params.require(:article).permit(:title, :text)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end