require 'rails_helper'

feature 'buying a ticket' do
  scenario 'logs in first' do
    van = FactoryGirl.create(:van)

    visit '/'
    click_link 'Create account'

    expect(page).to have_link 'Sign up with Facebook'

    fill_in 'First name', with: 'Aaron'
    fill_in 'Last name', with: 'Glasenapp'
    fill_in 'email', with: 'glassbead@gmail.com'
    fill_in 'phone', with: '7202379141'

    click_link 'Create account'

    expect(page).to have_text 'Thank you for creating an account'
    expect(page).to have_text 'glassbead@gmail.com'
    expect(page).to have_text 'Logout'

    click_link 'View Schedule'

    click_link '/tickets/new?van_id=1'

    expect(page).to have_text 'Buy Your Ticket Here'

    expect(page).to have_text 'Aaron'
    expect(page).to have_text 'Glasenapp'
    expect(page).to have_text 'glassbead@gmail.com'
    expect(page).to have_text 'CSU on Fri: Oct 3, 8:30 am'

    click_link 'Buy ticket'

    # go to wepay
    # return from wepay

    expect(page).to have_text 'Thank you'

    expect(ActionMailer::base.deliveries).to have(1).email

    expect(Passenger.find_by(last_name: 'Glasenapp').tickets.count).to eq(1)
    expect(van.tickets.count).to eq(1)
    expect(van.seats_available).to eq(13)

  end

  scenario 'clicks buy ticket first, then creates account' do
    van = FactoryGirl.create(:van, id: 501)
    visit '/'

    click_link 'View Schedule'
    click_link '/tickets/new?van_id=501'

    expect(page).to have_text 'Please Log in or create an account before you buy a ticket'

    click_link 'Create account'

    expect(page).to have_link 'Sign up with Facebook'

    fill_in 'First name', with: 'Shane'
    fill_in 'Last name', with: 'Wyenn'
    fill_in 'Email', with: 'shane@example.com'
    fill_in 'Phone', with: '123-456-7890'

    click_link 'Create account'

    expect(page).to have_link 'Back to Schedule', href: '/vans'

    expect(page).to have_text 'Buy Your Ticket Here'
    expect(page).to have_text 'Shane'
    expect(page).to have_text 'Wyenn'
    expect(page).to have_text 'shane@example.com'
    expect(page).to have_text 'CSU on Fri: Oct 3, 8:30 am'

    click_link 'Buy ticket'

    # go to wepay
    # return from wepay

    expect(page).to have_text 'Thank you'

    expect(ActionMailer::base.deliveries).to have(1).email

    expect(Passenger.find_by(last_name: 'Glasenapp').tickets.count).to eq(1)
    expect(van.tickets.count).to eq(1)
    expect(van.seats_available).to eq(13)
  end

  scenario 'clicks buy ticket first, then logs in' do
    van = FactoryGirl.create(:van, id: 501)
    passenger = FactoryGirl.create(:passenger)
    visit '/'

    click_link 'View Schedule'
    click_link '/tickets/new?van_id=501'

    expect(page).to have_text 'Please Log in or create an account before you buy a ticket'

    expect(page).to have_link 'Log in with Facebook'

    fill_in 'Email', with: passenger.email
    fill_in 'Password', with: passenger.password

    click_link 'Log in'

    expect(page).to have_link 'Back to Schedule', href: '/vans'

    expect(page).to have_text 'Buy Your Ticket Here'
    expect(page).to have_text passenger.first_name
    expect(page).to have_text passenger.last_name
    expect(page).to have_text passenger.email
    expect(page).to have_text 'CSU on Fri: Oct 3, 8:30 am'

    click_link 'Buy ticket'

    # go to wepay
    # return from wepay

    expect(page).to have_text 'Thank you'

    expect(ActionMailer::base.deliveries).to have(1).email

    expect(Passenger.find_by(last_name: 'Glasenapp').tickets.count).to eq(1)
    expect(van.tickets.count).to eq(1)
    expect(van.seats_available).to eq(13)
  end

end
