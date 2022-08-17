require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:author) do
    User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  end
  subject(:post) { Post.create(author:, title: 'Hello', text: 'This is my first post') }

  context 'When testing GET #index' do
    before(:example) { get user_posts_path(author.id) }

    after(:example) do
      Post.destroy_all
      User.destroy_all
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'should display correct placeholder' do
      expect(response.body).to include('Pagination')
    end
  end

  context 'When testing GET #show' do
    before(:example) { get user_post_path(author.id, post.id) }

    after(:example) do
      Post.destroy_all
      User.destroy_all
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('show')
    end

    it 'should display correct placeholder' do
      expect(response.body).to include('by')
    end
  end
end
