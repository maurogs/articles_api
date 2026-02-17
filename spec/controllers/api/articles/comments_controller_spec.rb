describe Api::Articles::CommentsController, type: :request do
  let(:article) { create(:article) }

  describe '#index' do
    let!(:comment) { create_list(:comment, 5, article: article) }

    let(:query) { get "/api/articles/#{article.id}/comments" }

    before { query }

    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns the serialized comment' do
      expect(rendered_json['data'].first['type']).to eq('comment')
    end

    it 'returns the selected comment attributes' do
      expect(rendered_json['data'].first['attributes'].keys)
        .to eq(%w[authorName body createdAt])
    end

    it 'returns the comment relationships' do
      expect(rendered_json['data'].first['relationships'].keys)
        .to eq(%w[article])
    end

    it 'returns the list of comments' do
      expect(rendered_json['data'].length).to eq(5)
    end
  end
end
