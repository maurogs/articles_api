class Article < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, :body, :author_name, presence: true
end
