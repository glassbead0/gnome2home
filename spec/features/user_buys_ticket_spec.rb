require 'rails_helper'

feature 'buying a ticket' do
  scenario 'logs in first' do
    Van.seed_data!
    van = Van.first

    visit '/'
    click_link 'Create Account'

   # expect(page).to have_link 'Sign up with Facebook'

    fill_in 'First name', with: 'Aaron'
    fill_in 'Last name', with: 'Glasenapp'
    fill_in 'Email', with: 'glassbead@gmail.com'
    fill_in 'Phone', with: '7202379141'
    fill_in 'Password', with: 'myPassword'
    fill_in 'Password confirmation', with: 'myPassword'

    click_button 'Create account'

    expect(page).to have_text 'Welcome! You have signed up successfully.'
    expect(page).to have_text 'glassbead@gmail.com'
    expect(page).to have_text 'Logout'

    click_link 'View Schedule'

    click_link 'ticket_for_van_1'

    expect(page).to have_text 'Buy Your Ticket Here'


    expect(find_field('ticket_first_name').value).to eq 'Aaron'
    expect(find_field('ticket_last_name').value).to eq 'Glasenapp'
    expect(find_field('ticket_email').value).to eq 'glassbead@gmail.com'

    expect(page).to have_text 'CSU on Thu: Oct 2, 2:00 pm'

    click_button 'Buy Ticket'

    # go to wepay
    # return from wepay

    expect(page).to have_text 'Thank you'

    expect(ActionMailer::Base.deliveries).to have(1).email

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

    click_link 'Create Account'

    #expect(page).to have_link 'Sign up with Facebook'

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
    expect(Ticket.first.qrcode).to eq('http://gnome2home.com/scan?confirmation=1')
  end

  scenario 'clicks buy ticket first, then logs in' do
    van = FactoryGirl.create(:van, id: 501)
    passenger = FactoryGirl.create(:passenger)
    visit '/'

    click_link 'View Schedule'
    click_link '/tickets/new?van_id=501'

    expect(page).to have_text 'Please Log in or create an account before you buy a ticket'

    #expect(page).to have_link 'Log in with Facebook'

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
