require 'rails_helper'

RSpec.describe "tickets/new", :type => :view do
  before(:each) do
    assign(:ticket, Ticket.new(
      :scanned => false
    ))
  end

  it "renders new ticket form" do
    render

    assert_select "form[action=?][method=?]", tickets_path, "post" do

      assert_select "input#ticket_scanned[name=?]", "ticket[scanned]"
    end
  end
end
