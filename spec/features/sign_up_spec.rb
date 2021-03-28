require 'rails_helper'

RSpec.describe 'Signing up a user' do
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
