require 'rails_helper'

RSpec.describe 'Event management', type: :feature do
  before :each do
    @signed_up_user = User.create(username: 'signed_up_user')
    @other_user = User.create(username: 'other_username')
    visit('/user_sessions/new')
    within('fieldset') do
      fill_in 'username', with: @signed_up_user.username
    end
    click_button 'Sign in'
  end

  context 'Event creation' do
    it 'should create an event' do
      visit('/events/new')

      fill_in 'event_name', with: 'Event_name'
      fill_in 'event_description', with: 'Event_description'
      fill_in 'event_date', with: DateTime.now
      fill_in 'event_venue', with: 'Event_venue'
      click_button 'Create Event'

      expect(page).to have_content('Event created')
    end
  end

  context 'Inviting users' do
    before do
      @event = Event.create(name: 'Event_name', description: 'Event_description', \
                            date: DateTime.now, venue: 'Event_venue', creator_id: 1)
    end

    it 'should invite a user' do
      visit('/attendances/new')
      select @other_user.username, from: 'attendance_attendee_id'
      select @event.name, from: 'attendance_event_id'
      click_button 'Invite'

      expect(page).to have_content('User invited')
    end
  end
end
