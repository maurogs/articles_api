module Api
  class CommentsController < ApiController
    before_action :set_comment, only: :show

    def show
      render_serialized_json @comment
    end

    def create
      comment = Comment.new(comment_params)

      if comment.save
        render_serialized_json comment
      else
        render_json_errors(comment: comment.errors.details)
      end
    end

    private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :author_name, :article_id)
    end
  end
end
