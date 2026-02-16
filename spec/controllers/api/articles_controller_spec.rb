describe Api::ArticlesController, type: :request do
  describe '#index' do
    let!(:article) { create(:article) }

    let(:query) do
      get "/api/articles"
    end

    before { query }

    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns the serialized article' do
      expect(rendered_json['data'].map { |article| article['id'].to_i }).to \
        contain_exactly(article.id)
    end

    it 'returns the selected article attributes' do
      expect(rendered_json['data'].first['attributes'].keys)
        .to eq(%w[title authorName body])
    end

    it 'returns the article relationships' do
      expect(rendered_json['data'].first['relationships'].keys)
        .to eq(%w[comments])
    end
  end

  describe '#create' do
    let(:query) do
      post "/api/articles",
           params: { article: { title: "Title", body: "Body", author_name: "John Doe" } }
    end

    before { query }

    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'creates the article' do
      expect(Article.count).to eq(1)
    end

    it 'returns the serialized article' do
      expect(rendered_json['data']['type']).to eq('article')
    end

    it 'returns the article title' do
      query

      expect(rendered_json['data']['attributes']['title']).to eq("Title")
    end

    it 'returns the article relationships' do
      query

      expect(rendered_json['data']['relationships'].keys)
        .to eq(%w[comments])
    end
  end
end
