describe Api::CommentsController, type: :request do
  let!(:article) { create(:article) }

  describe '#show' do
    let!(:comment) { create(:comment) }

    let(:query) { get "/api/comments/#{comment.id}" }

    before { query }

    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns the serialized comment' do
      query
      expect(rendered_json['data']['type']).to eq('comment')
    end

    it 'returns the selected comment attributes' do
      expect(rendered_json['data']['attributes'].keys)
        .to eq(%w[authorName body createdAt])
    end

    it 'returns the comment relationships' do
      expect(rendered_json['data']['relationships'].keys)
        .to eq(%w[article])
    end
  end

  describe '#create' do
    let(:query) do
      post "/api/comments",
           params: { comment: { body: "Body", author_name: "John Doe", article_id: article.id } }
    end

    before { query }

    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'creates the comment' do
      expect(Comment.count).to eq(1)
    end

    it 'returns the serialized comment' do
      expect(rendered_json['data']['type']).to eq('comment')
    end

    it 'returns the comment title' do
      query

      expect(rendered_json['data']['attributes']['body']).to eq("Body")
    end

    it 'returns the comment relationships' do
      query

      expect(rendered_json['data']['relationships'].keys)
        .to eq(%w[article])
    end
  end
end
