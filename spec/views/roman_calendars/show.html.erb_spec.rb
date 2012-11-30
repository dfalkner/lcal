require 'spec_helper'

describe "roman_calendars/show" do
  before(:each) do
    @roman_calendar = assign(:roman_calendar, stub_model(RomanCalendar,
      :feast_day => "Feast Day",
      :rank_id => 1,
      :color => "Color",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Feast Day/)
    rendered.should match(/1/)
    rendered.should match(/Color/)
    rendered.should match(/Description/)
  end
end
