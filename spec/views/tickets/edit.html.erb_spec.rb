require 'rails_helper'

RSpec.describe "tickets/edit", :type => :view do
  before(:each) do
    @ticket = assign(:ticket, Ticket.create!(
      :scanned => false
    ))
  end

  it "renders the edit ticket form" do
    render

    assert_select "form[action=?][method=?]", ticket_path(@ticket), "post" do

      assert_select "input#ticket_scanned[name=?]", "ticket[scanned]"
    end
  end
end
