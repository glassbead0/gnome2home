require 'rails_helper'

RSpec.describe "vans/show", :type => :view do
  before(:each) do
    @van = assign(:van, Van.create!(
      :driver => "Driver",
      :direction => "Direction",
      :seats_available => 1,
      :seats_occupied => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Driver/)
    expect(rendered).to match(/Direction/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
  end
end
