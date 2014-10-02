require 'rails_helper'

RSpec.describe "tickets/show", :type => :view do
  before(:each) do
    @ticket = assign(:ticket, Ticket.create!(
      :scanned => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
  end
end
