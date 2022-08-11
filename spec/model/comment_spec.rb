require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:author) { User.new(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:post) { Post.new(author:, title: 'Hello', text: 'This is my first post') }
  let(:comment) { Comment.new(author:, post:, text: 'my comment') }

  before do
    post.save
    author.save
    comment.save
  end

  context 'When updating comment counter' do
    it 'update_comments_counter should update comment counter in posts by 1' do
      expect(comment.post.comments_count).to eq(1)
    end
  end
end
