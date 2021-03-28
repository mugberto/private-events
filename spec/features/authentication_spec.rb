require 'rails_helper'

RSpec.describe 'Authentication', type: :feature do
  context 'Signing up' do
    before :each do
      User.create(username: 'existing_username')
    end

    it 'should create a new user if a user does not exist' do
      visit('/users/new')
      within('fieldset') do
        fill_in 'Username', with: 'any_username'
      end
      click_button 'Create User'
      expect(page).to have_content('New user created')
    end

    it 'should not create a new user if the user exists' do
      visit('/users/new')
      within('fieldset') do
        fill_in 'Username', with: 'existing_username'
      end
      click_button 'Create User'
      expect(page).to have_content('Username has already been taken')
    end
  end

  context 'Signing in' do
    before :each do
      User.create(username: 'signed_up_user')
    end

    it 'should create a new session if a user is registered' do
      visit('/user_sessions/new')
      within('fieldset') do
        fill_in 'username', with: 'signed_up_user'
      end
      click_button 'Sign in'
      expect(page).to have_content('Logged in')
    end

    it 'should not create a new session if the user is not registered' do
      visit('/user_sessions/new')
      within('fieldset') do
        fill_in 'username', with: 'any_username'
      end
      click_button 'Sign in'
      expect(page).to have_content('Invalid username')
    end
  end

  context 'Logging out' do
    before :each do
      User.create(username: 'signed_up_user')
      visit('/user_sessions/new')
      within('fieldset') do
        fill_in 'username', with: 'signed_up_user'
      end
      click_button 'Sign in'
    end

    it "should destroy user's session" do
      visit('/events')
      click_link 'log out'
      expect(page).to have_content('Logged out')
    end
  end
end
