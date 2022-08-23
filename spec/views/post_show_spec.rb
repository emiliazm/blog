require 'rails_helper'

RSpec.describe 'Users index page', type: :feature do
  before(:example) do
    @user = User.create(name: 'Tom',
                        photo: 'https://e7.pngegg.com/pngimages/178/595/png-clipart-user-profile-computer-icons-login-user-avatars-monochrome-black.png',
                        bio: 'Teacher from Mexico.')
    @post = Post.create(author: @user, title: 'Hello1', text: 'post1')
    @comment = Comment.create(author: @user, post: @post, text: 'my comment')
    visit user_post_path(@user.id, @post.id)
  end

  context 'When starting at post index page' do
    it 'posts title should be showed.' do
      expect(page).to have_content('Hello1')
    end

    it 'some of the posts body should be showed.' do
      expect(page).to have_content('Hello1 by Tom')
    end

    it 'the amount of comments should be showed.' do
      expect(page).to have_content('Comments:')
      expect(@comment.post.comments_count).to eq(1)
    end

    it 'the amount of likes should be showed.' do
      expect(page).to have_content 'Likes:'
      expect(@post.likes_count).to eq(0)
    end
  end

  context 'When starting at post index page' do
    it 'the posts body should be showed.' do
      expect(page).to have_content('post1')
    end

    it 'the user name of the commentor should be showed' do
      expect(page).to have_content('Tom')
    end

    it 'the comment of each commentor should be showed on the left.' do
      expect(page).to have_content('Tom : my comment')
    end
  end
end
