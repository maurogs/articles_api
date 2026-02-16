FactoryBot.define do
  factory :comment do
    body { "This is a comment" }
    author_name { "John Doe" }
    article { association(:article) }
  end
end
