class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render json: @articles
  end
  def show
    @article = Article.find(params[:id])
    render json: @article
  end



  def new
    @article = Article.new
    render json: @article
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article, status: :created
    else
      render json: { errors: @article.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
    render json: @article
  end

  def update
    @article = Article.find(params[:id])
  
    if @article.update(article_params)
      render json: @article, status: :ok
    else
      render json: { errors: @article.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      render json: { message: 'Article deleted successfully' }, status: :ok
    else
      render json: { errors: 'Failed to delete the article' }, status: :unprocessable_entity
    end
  end

  private
    def article_params
      params.expect(article: [:title, :body])
    end
end