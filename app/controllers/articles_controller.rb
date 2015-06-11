class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order('created_at DESC')
  end
  
  def show
    @article = Article.find(params[:id])
    # sending a blank comment object to the articles show view
    @comment = Comment.new
    @comment.article_id = @article.id
  end
  
  def new
    @article = Article.new
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    @article.update_attributes(article_params)
    
    flash.notice = "#{@article.title} has been updated"
    redirect_to @article
    
  end
  
  def create
    @article = Article.new(article_params)
    
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    
    redirect_to articles_path
  end
  
  private
  
    def article_params
      params.require(:article).permit(:title, :body, :tag_list, :picture)
    end
end
