# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Article.destroy_all

articles = rand(20..40).times.map do
  {
    title: Faker::Book.title,
    body: Faker::Lorem.paragraphs(number: rand(5..10)).join("\n\n"),
    author_name: Faker::Name.name,
    created_at: Faker::Time.between(from: 3.years.ago, to: Time.current)
  }
end

Article.insert_all(articles)

comments = Article.pluck(:id).flat_map do |article_id|
  Array.new(rand(3..20)) do
    {
      body: Faker::Lorem.paragraph(sentence_count: rand(2..5)),
      author_name: Faker::Name.name,
      article_id: article_id,
      created_at: Faker::Time.between(from: 3.years.ago, to: Time.current)
    }
  end
end

Comment.insert_all(comments)
