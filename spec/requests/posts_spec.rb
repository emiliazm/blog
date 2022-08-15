require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  context 'When testing GET #index' do
    before(:example) { get '/users/:id/posts' }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'should display correct placeholder' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  context 'When testing GET #show' do
    before(:example) { get '/users/:id/posts/:id' }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('show')
    end

    it 'should display correct placeholder' do
      expect(response.body).to include('Here is a specific post by id')
    end
  end
end
