FactoryBot.define do
  factory :article do
    title { "Article Title" }
    body { "This is the article content." }
    author_name { "John Doe" }
  end
end
