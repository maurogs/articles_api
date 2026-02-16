describe ArticleSerializer do
  subject(:serializer) { described_class.new(article) }

  let(:article) { create(:article) }
  let!(:comment) { create(:comment, article: article) }

  it 'returns the serialized article' do
    expect(serializer.serializable_hash[:data]).to eq(
      id: article.id.to_s,
      type: :article,
      attributes: {
        title: article.title,
        authorName: article.author_name,
        body: article.body
      },
      relationships: {
        comments: { data: [ { id: comment.id.to_s, type: :comment } ] }
      }
    )
  end
end
