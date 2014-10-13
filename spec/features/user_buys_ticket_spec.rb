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
    expect(Ticket.first.van.seats_available).to eq(13)
    expect(Ticket.first.qrcode).to eq('http://gnome2home.herokuapp.com/scan/ticket?ticket_id=1')

    # fill van and buy another ticket

    van.seats_available = 0
    van.save

    click_link 'Schedule'

    expect(page).to_not have_link 'ticket_for_van_1'
    expect(page).to have_text 'Van is full'

  end

  scenario 'clicks buy ticket first, then creates account' do
    ActionMailer::Base.deliveries.clear
    Van.seed_data!
    van = Van.find(42)

    visit '/'

    click_link 'View Schedule'
    click_link 'ticket_for_van_42'

    expect(page).to have_text 'You need to sign in or sign up before continuing.'

    click_link 'Create Account'

    #expect(page).to have_link 'Sign up with Facebook'

    fill_in 'First name', with: 'Shane'
    fill_in 'Last name', with: 'Wyenn'
    fill_in 'Email', with: 'shane@example.com'
    fill_in 'Phone', with: '123-456-7890'
    fill_in 'Password', with: 'mypassword'
    fill_in 'Password confirmation', with: 'mypassword'


    click_button 'Create account'


    expect(page).to have_link 'Back to Schedule'

    expect(page).to have_text 'Buy Your Ticket Here'
    expect(find_field('ticket_first_name').value).to eq 'Shane'
    expect(find_field('ticket_last_name').value).to eq 'Wyenn'
    expect(find_field('ticket_email').value).to eq 'shane@example.com'
    expect(page).to have_text 'Union Station on Sun: Oct 12, 3:15 pm'

    click_button 'Buy Ticket'

    # go to wepay
    # return from wepay

    expect(page).to have_text 'Thank you'

    expect(ActionMailer::Base.deliveries).to have(1).email

    shane = Passenger.find_by(last_name: 'Wyenn')
    expect(shane.tickets.count).to eq(1)
    expect(van.tickets.count).to eq(1)
    expect(Ticket.first.van.seats_available).to eq(13)
    expect(shane.tickets.first.qrcode).to eq('http://gnome2home.herokuapp.com/scan/ticket?ticket_id=1')
  end

  scenario 'clicks buy ticket first, then logs in' do
    ActionMailer::Base.deliveries.clear
    Van.seed_data!
    van = Van.find(12)
    FactoryGirl.create(:ticket)
    passenger = FactoryGirl.create(:passenger)
    visit '/'

    click_link 'View Schedule'
    click_link 'ticket_for_van_12'

    expect(page).to have_text 'You need to sign in or sign up before continuing.'

    #expect(page).to have_link 'Log in with Facebook'

    fill_in 'Email', with: passenger.email
    fill_in 'Password', with: passenger.password


    click_button 'Log_in'
    expect(page).to have_link 'Back to Schedule'

    expect(page).to have_text 'Buy Your Ticket Here'
    expect(find_field('ticket_first_name').value).to eq passenger.first_name
    expect(find_field('ticket_last_name').value).to eq passenger.last_name
    expect(find_field('ticket_email').value).to eq passenger.email
    expect(page).to have_text 'Sat: Oct 4, 10:45 pm'


    click_button 'Buy Ticket'

    # go to wepay
    # return from wepay

    expect(page).to have_text 'Thank you'

    expect(ActionMailer::Base.deliveries).to have(1).email

    expect(passenger.tickets.count).to eq(1)
    expect(van.tickets.count).to eq(1)
    expect(passenger.vans.first.seats_available).to eq(13)
    expect(passenger.tickets.first.qrcode).to eq('http://gnome2home.herokuapp.com/scan/ticket?ticket_id=2')
  end

end
