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

    click_button 'My Tickets'

    old_ticket_name = ticket.first_name
    expect(page).to have_text ticket.first_name
    expect(page).to have_text ticket.last_name
    expect(page).to have_text ticket.email
    expect(page).to have_text 'Confirmation Number'
    expect(page).to have_text ticket.id
    expect(page).to have_text van.departure_time
    click_button 'Edit'
    fill_in 'First name', with: passenger.first_name
    click_button 'Update Ticket'

    expect(page).to have_text 'Ticket was successfully updated'
    click_button 'My Tickets'
    expect(page).to have_text passenger.first_name
    expect(page).to_not have_text old_ticket_name
    expect(click_button 'Delete').to change(van.seats_available).by(1)

  end
end
