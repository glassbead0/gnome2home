require 'rails_helper'

RSpec.describe "vans/new", :type => :view do
  before(:each) do
    assign(:van, Van.new(
      :driver => "MyString",
      :direction => "MyString",
      :seats_available => 1,
      :seats_occupied => ""
    ))
  end

  it "renders new van form" do
    render

    assert_select "form[action=?][method=?]", vans_path, "post" do

      assert_select "input#van_driver[name=?]", "van[driver]"

      assert_select "input#van_direction[name=?]", "van[direction]"

      assert_select "input#van_seats_available[name=?]", "van[seats_available]"

      assert_select "input#van_seats_occupied[name=?]", "van[seats_occupied]"
    end
  end
end
