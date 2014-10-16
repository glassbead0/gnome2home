require 'rails_helper'

feature 'can see my purchased tickets' do
  scenario 'buy ticket, see on profile page' do
    passenger = FactoryGirl.create(:passenger)
    van = FactoryGirl.create(:van)
    ticket = FactoryGirl.create(:ticket, email: passenger.email)
    ticket.van = van
    ticket.passenger = passenger
    passenger.tickets << ticket
    van.tickets << ticket

    visit 'passengers/sign_in'
    fill_in 'Email', with: passenger.email
    fill_in 'Password', with: passenger.password
    click_button 'Log In'


    click_link passenger.email

    click_link 'My Tickets'

    expect(page).to have_text ticket.first_name
    expect(page).to have_text ticket.last_name
    expect(page).to have_text ticket.email
    expect(page).to have_text 'Confirmation #'
    expect(page).to have_text ticket.id
    expect(page).to have_text van.departure_time_readable

    # expect(click_link 'Cancel Ticket').to change { van.seats_available }.by(1)

  end
end
