class CommentSerializer < ApplicationSerializer
  cache_options store: Rails.cache,
                namespace: "jsonapi-serializer-comments",
                expires_in: 24.hours

  belongs_to :article, serializer: ::ArticleSerializer

  attributes :body, :author_name
end
