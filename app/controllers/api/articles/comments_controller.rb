module Api
  module Articles
    class CommentsController < ApiController
      before_action :set_article

      def index
        render_serialized_json(@article.comments)
      end

      private

      def set_article
        @article = Article.find(params[:article_id])
      end
    end
  end
end
