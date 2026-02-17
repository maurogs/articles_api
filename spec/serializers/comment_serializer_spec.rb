describe CommentSerializer do
  subject(:serializer) { described_class.new(comment) }

  let(:article) { create(:article) }
  let(:comment) { create(:comment, article: article) }

  it 'returns the serialized comment' do
    expect(serializer.serializable_hash[:data]).to eq(
      id: comment.id.to_s,
      type: :comment,
      attributes: {
        authorName: comment.author_name,
        body: comment.body,
        createdAt: comment.created_at
      },
      relationships: {
        article: { data: { id: article.id.to_s, type: :article } }
      }
    )
  end
end
