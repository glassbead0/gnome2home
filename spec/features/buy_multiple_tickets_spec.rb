require 'rails_helper'

feature 'buy multiple tickets' do
  scenario 'buy multiple tickets' do
    Van.seed_data!
    van = Van.first
    ActionMailer::Base.deliveries.clear

    visit '/'
    click_link 'Create Account'

    fill_in 'First name', with: 'Aaron'
    fill_in 'Last name', with: 'Glasenapp'
    fill_in 'Email', with: 'glassbead@gmail.com'
    fill_in 'Phone', with: '7202379141'
    fill_in 'Password', with: 'myPassword'
    fill_in 'Password confirmation', with: 'myPassword'

    click_button 'Create account'

    click_link 'View Schedule'

    click_link 'ticket_for_van_1'

    # finish this test!

  end
end
