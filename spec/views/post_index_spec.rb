require 'rails_helper'

RSpec.describe 'Users index page', type: :feature do
  before(:example) do
    @user = User.create(name: 'Tom',
                        photo: 'https://e7.pngegg.com/pngimages/178/595/png-clipart-user-profile-computer-icons-login-user-avatars-monochrome-black.png',
                        bio: 'Teacher from Mexico.')
    @post = Post.create(author: @user, title: 'Hello1', text: 'post1')
    @comment = Comment.create(author: @user, post: @post, text: 'my comment')
    visit user_posts_path(@user.id)
  end

  context 'When starting at post index page' do
    it 'Profile pictures should be showed' do
      @image = page.all('img')
      expect(@image.size).to eql(1)
    end

    it 'All users names should be showed' do
      expect(page).to have_content('Tom')
    end

    it 'Number of post of each user has written should be shown' do
      expect(page).to have_content('Number of posts')
    end

    it 'posts title should be showed.' do
      expect(page).to have_content('Hello1')
    end

    it 'some of the posts body should be showed.' do
      expect(page).to have_content('post1')
    end

    it 'first comments on a post should be showed.' do
      expect(page).to have_content 'my comment'
    end
  end

  context 'When starting at post index page' do
    it 'the amount of comments should be showed.' do
      expect(page).to have_content('Comments:')
      expect(@comment.post.comments_count).to eq(1)
    end

    it 'the amount of likes should be showed.' do
      expect(page).to have_content 'Likes:'
      expect(@post.likes_count).to eq(0)
    end

    it 'pagination button should be showed' do
      expect(page).to have_content 'Pagination'
    end

    it 'When I click on a post, it should redirects me to that posts show page.' do
      click_on 'Hello1'
      expect(page).to have_current_path user_post_path(@user.id, @post.id)
    end
  end
end
