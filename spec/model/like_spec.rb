require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:author) { User.new(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:post) { Post.new(author:, title: 'Hello', text: 'This is my first post') }
  let(:like) { Like.new(author:, post:) }

  before do
    post.save
    author.save
    like.save
  end

  context 'When updating likes counter' do
    it 'update_comments_counter should update comment counter in posts by 1' do
      expect(post.likes_count).to eq(1)
    end
  end
end
