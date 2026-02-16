module Api
  class ArticlesController < ApiController
    def index
      render_serialized_json Article.all
    end

    def create
      article = Article.new(article_params)

      if article.save
        render_serialized_json article
      else
        render_json_errors(article: article.errors.details)
      end
    end

    private

    def article_params
      params.require(:article).permit(:author_name, :body, :title)
    end
  end
end
