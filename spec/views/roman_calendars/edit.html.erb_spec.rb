require 'spec_helper'

describe "roman_calendars/edit" do
  before(:each) do
    @roman_calendar = assign(:roman_calendar, stub_model(RomanCalendar,
      :feast_day => "MyString",
      :rank_id => 1,
      :color => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit roman_calendar form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => roman_calendars_path(@roman_calendar), :method => "post" do
      assert_select "input#roman_calendar_feast_day", :name => "roman_calendar[feast_day]"
      assert_select "input#roman_calendar_rank_id", :name => "roman_calendar[rank_id]"
      assert_select "input#roman_calendar_color", :name => "roman_calendar[color]"
      assert_select "input#roman_calendar_description", :name => "roman_calendar[description]"
    end
  end
end
