require 'rails_helper'

RSpec.describe User, type: :model do
  let(:author) { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', post_count: 1) }

  before { author.save }

  context 'When name must not be blank.' do
    it 'name should be present' do
      author.name = nil
      expect(author).to_not be_valid
    end

    it 'name should be valid' do
      expect(author).to be_valid
    end
  end

  context 'When post_counter must be an integer greater than or equal to zero.' do
    it 'post_counter should not be valid when negative numbers.' do
      author.post_count = -1
      expect(author).to_not be_valid
    end

    it 'post_counter should not be valid when null.' do
      author.post_count = nil
      expect(author).to_not be_valid
    end

    it 'post_counter must be valid with an integer greater than or equal to zero.' do
      expect(author).to be_valid
    end
  end

  context 'When checking for the first three recent post' do
    before do
      8.times { Post.create(author:, title: 'Hello', text: 'This is my first post') }
    end

    it 'three_most_recent_posts should return only the first three recent comments' do
      post_count = author.three_most_recent_posts.length
      expect(post_count).to eq(3)
    end
  end
end
