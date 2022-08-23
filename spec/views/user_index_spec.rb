require 'rails_helper'

RSpec.describe 'Users index page', type: :feature do
  context 'When starting at user index page' do
    before(:example) do
      @user = User.create(name: 'Tom',
                          photo: 'https://e7.pngegg.com/pngimages/178/595/png-clipart-user-profile-computer-icons-login-user-avatars-monochrome-black.png',
                          bio: 'Teacher from Mexico.')
      @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
      visit '/users'
    end

    it 'All users names should be showed' do
      expect(page).to have_content('Tom')
    end

    it 'Profile pictures should be showed' do
      @image = page.all('img')
      expect(@image.size).to eql(1)
    end

    it 'Number of post of each user has written should be shown' do
      expect(page).to have_content('Number of posts')
      expect(@user.post_count).to eq(1)
    end

    it 'When clicking on a user I should be redirected to the users show page' do
      click_on 'Tom'
      expect(page).to have_current_path user_path(@user.id)
    end
  end
end
