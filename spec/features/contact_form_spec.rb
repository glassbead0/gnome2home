require 'rails_helper'

feature 'users can send feedback on the contact page' do
  scenario 'not logged in, sends feedback' do
    visit '/contact'
    fill_in 'full_name', with: 'Eric Vahid'
    fill_in 'email', with: 'eric@example.com'
    fill_in 'phone', with: '1234565432'
    fill_in 'message', with: 'this is my message'

    click_button 'Send Message'

    expect(page).to have_text 'Thanks for contacting us'

    expect(ActionMailer::Base.deliveries).to have(1).email

  end

  scenario 'logged in passenger sends message' do
    ActionMailer::Base.deliveries.clear
    passenger = FactoryGirl.create(:passenger)
    visit '/passengers/sign_in'
    fill_in 'Email', with: passenger.email
    fill_in 'Password', with: passenger.password

    click_button 'Log In'

    click_link 'Contact'
    expect(find_field('full_name').value).to eq("#{passenger.first_name} #{passenger.last_name}")
    expect(find_field('phone').value).to eq(passenger.phone)
    expect(find_field('email').value).to eq(passenger.email)
    fill_in 'message', with: 'I think you guys are the bestest!'
    click_button 'Send Message'

    expect(page).to have_text 'Thanks for contacting us'

    expect(ActionMailer::Base.deliveries).to have(1).email
  end

end
