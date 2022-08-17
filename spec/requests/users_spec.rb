require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'When testing GET #index' do
    before(:example) { get '/users' }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'should display correct placeholder' do
      expect(response.body).to include('Here is a list of users order by id')
    end
  end

  context 'When testing GET #show' do
    subject(:author) do
      User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    end

    before(:example) { get user_path(author.id) }

    after(:example) { User.destroy_all }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('show')
    end

    it 'should display correct placeholder' do
      expect(response.body).to include('See all posts')
    end
  end
end
