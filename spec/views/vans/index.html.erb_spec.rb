require 'rails_helper'

RSpec.describe "vans/index", :type => :view do
  before(:each) do
    assign(:vans, [
      Van.create!(
        :driver => "Driver",
        :direction => "Direction",
        :seats_available => 1,
        :seats_occupied => ""
      ),
      Van.create!(
        :driver => "Driver",
        :direction => "Direction",
        :seats_available => 1,
        :seats_occupied => ""
      )
    ])
  end

  it "renders a list of vans" do
    render
    assert_select "tr>td", :text => "Driver".to_s, :count => 2
    assert_select "tr>td", :text => "Direction".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
