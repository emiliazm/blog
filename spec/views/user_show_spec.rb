require 'rails_helper'

RSpec.describe 'Users index page', type: :feature do
  before(:example) do
    @user = User.create(name: 'Tom',
                        photo: 'https://e7.pngegg.com/pngimages/178/595/png-clipart-user-profile-computer-icons-login-user-avatars-monochrome-black.png',
                        bio: 'Teacher from Mexico.')
    @post1 = Post.create(author: @user, title: 'Hello1', text: 'post1')
    @post2 = Post.create(author: @user, title: 'Hello2', text: 'post2')
    @post3 = Post.create(author: @user, title: 'Hello3', text: 'post3')
    visit user_path(@user.id)
  end

  context 'When starting at user show page' do
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

    it 'user bio should be showed' do
      expect(page).to have_content('Bio')
    end

    it 'user bio should be showed' do
      expect(page).to have_content('Bio')
    end
  end

  context 'When starting at user show page' do
    it 'users first 3 posts should be showed' do
      post_count = @user.three_most_recent_posts.length
      expect(post_count).to eq(3)
    end

    it 'a button that lets me view all of a users posts should be exist' do
      expect(page).to have_content('See all posts')
    end

    it 'When I click a users post, it should redirects me to that posts show page.' do
      click_on 'Hello1'
      expect(page).to have_current_path user_post_path(@user.id, @post1.id)
    end
  end
end
