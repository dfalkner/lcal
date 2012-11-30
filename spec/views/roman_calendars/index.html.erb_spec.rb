require 'spec_helper'

describe "roman_calendars/index" do
  before(:each) do
    assign(:roman_calendars, [
      stub_model(RomanCalendar,
        :feast_day => "Feast Day",
        :rank_id => 1,
        :color => "Color",
        :description => "Description"
      ),
      stub_model(RomanCalendar,
        :feast_day => "Feast Day",
        :rank_id => 1,
        :color => "Color",
        :description => "Description"
      )
    ])
  end

  it "renders a list of roman_calendars" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Feast Day".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
