require 'rails_helper'

RSpec.describe "vans/edit", :type => :view do
  before(:each) do
    @van = assign(:van, Van.create!(
      :driver => "MyString",
      :direction => "MyString",
      :seats_available => 1,
      :seats_occupied => ""
    ))
  end

  it "renders the edit van form" do
    render

    assert_select "form[action=?][method=?]", van_path(@van), "post" do

      assert_select "input#van_driver[name=?]", "van[driver]"

      assert_select "input#van_direction[name=?]", "van[direction]"

      assert_select "input#van_seats_available[name=?]", "van[seats_available]"

      assert_select "input#van_seats_occupied[name=?]", "van[seats_occupied]"
    end
  end
end
