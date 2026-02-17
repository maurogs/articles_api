class Comment < ApplicationRecord
  belongs_to :article, counter_cache: true

  validates :body, :author_name, presence: true
end
