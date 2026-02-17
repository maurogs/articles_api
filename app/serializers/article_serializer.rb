class ArticleSerializer < ApplicationSerializer
  cache_options store: Rails.cache,
                namespace: "jsonapi-serializer-articles",
                expires_in: 24.hours

  has_many :comments, serializer: ::CommentSerializer

  attributes :title, :author_name, :body, :comments_count, :created_at
end
