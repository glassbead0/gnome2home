require 'rails_helper'

RSpec.describe "tickets/index", :type => :view do
  before(:each) do
    assign(:tickets, [
      Ticket.create!(
        :scanned => false
      ),
      Ticket.create!(
        :scanned => false
      )
    ])
  end

  it "renders a list of tickets" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
