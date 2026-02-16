class Comment < ApplicationRecord
  belongs_to :article

  validates :body, :author_name, presence: true
end
