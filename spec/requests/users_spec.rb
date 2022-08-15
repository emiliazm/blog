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
    before(:example) { get '/users/:id' }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('show')
    end

    it 'should display correct placeholder' do
      expect(response.body).to include('Here is the information for a specific user')
    end
  end
end
