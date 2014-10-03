require 'rails_helper'

feature 'admin scans a ticket' do
  scenario 'customer bought a ticket, admin scans' do
    visit '/scan/ticket'

    expect(page).to have_text 'not authorized'
    expect(page).to_not have_text 'Check riders in'

    admin = FactoryGirl.create(:admin)
    van = FactoryGirl.create(:van)
    stop1 = FactoryGirl.create(:stop)
    stop2 = FactoryGirl.create(:stop)
    stop3 = FactoryGirl.create(:stop)
    stop4 = FactoryGirl.create(:stop)
    van.stops << stop1 << stop2 << stop3 << stop4
    admin.vans << van
    passenger = FactoryGirl.create(:passenger)
    ticket = Ticket.create(:ticket)
    passenger.tickets << ticket
    ticket.van = van

    visit '/admins/sign_in'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_link 'Sign in'

    click_link 'Start trip'

    expect(page).to have_text 'Check riders in'
    expect(ticket.scanned).to eq(false)

    visit "/scan/ticket?ticket_id=#{ticket.id}"

    expect(page).to have_text "#{passenger.first_name} #{passenger.last_name} has been checked in"
    expect(ticket.scanned).to eq(true)
    expect(van.seats_occupied).to eq(1)

    visit "/scan/ticket?ticket_id=#{ticket.id}"

    expect(page).to have_text 'This ticket has already been scanned'


  end
end
