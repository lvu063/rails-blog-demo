# app/controllers/articles_controller.rb
#
# Full CRUD controller demonstrating Rails conventions:
#   - Strong parameters (security)
#   - before_action callbacks (DRY)
#   - RESTful resource routing
#   - Category filtering via scope
#   - Flash messages for UX

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  # GET /articles
  def index
    @articles  = Article.recent.by_category(params[:category])
    @categories = Article::CATEGORIES
  end

  # GET /articles/:id
  def show
    @comment = Comment.new
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # POST /articles
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "Article created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /articles/:id/edit
  def edit; end

  # PATCH/PUT /articles/:id
  def update
    if @article.update(article_params)
      redirect_to @article, notice: "Article updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /articles/:id
  def destroy
    @article.destroy
    redirect_to articles_path, notice: "Article deleted."
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  # Strong parameters — only permit expected fields
  def article_params
    params.require(:article).permit(:title, :body, :category)
  end
end
