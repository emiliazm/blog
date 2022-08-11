require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { Post.new(author:, title: 'Hello', text: 'This is my first post') }
  let(:author) { User.new(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  before do
    post.save
    author.save
  end

  context 'When name must not be blank' do
    it 'title should be present.' do
      post.title = nil
      expect(post).to_not be_valid
    end

    it 'title should be valid.' do
      expect(post).to be_valid
    end
  end

  context 'When title must not exceed 250 characters ' do
    it 'title should not exceed 250 characters.' do
      post.title = 'a' * 300
      expect(post).to_not be_valid
    end

    it 'title should not exceed 250 characters and should be valid' do
      expect(post).to be_valid
    end
  end

  context 'When comments_count must be an integer greater than or equal to zero.' do
    it 'comments_count should not be valid when negative numbers.' do
      post.comments_count = -1
      expect(post).to_not be_valid
    end

    it 'comments_count should not be valid when null' do
      post.comments_count = nil
      expect(post).to_not be_valid
    end

    it 'comments_count should be valid with numbers greater that or equal to zero' do
      expect(post).to be_valid
    end
  end

  context 'When likes_count must be an integer greater than or equal to zero.' do
    it 'likes_count should not be valid when negative numbers.' do
      post.likes_count = -1
      expect(post).to_not be_valid
    end

    it 'likes_count should not be valid when null' do
      post.likes_count = nil
      expect(post).to_not be_valid
    end

    it 'likes_count should be valid with numbers greater that or equal to zero' do
      expect(post).to be_valid
    end
  end

  context 'When updating post counter' do
    it 'update_post_counter should update post user counter by 1' do
      expect(author.post_count).to eq(1)
    end
  end

  context 'When checking for the first five recent comments' do
    before do
      8.times { Comment.create(author:, post:, text: 'my comment') }
    end

    it 'five_most_recent_comments should return only the first five recent comments' do
      comments = post.five_most_recent_comments.length
      expect(comments).to eq(5)
    end
  end
end
