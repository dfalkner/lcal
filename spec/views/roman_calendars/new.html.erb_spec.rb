require 'spec_helper'

describe "roman_calendars/new" do
  before(:each) do
    assign(:roman_calendar, stub_model(RomanCalendar,
      :feast_day => "MyString",
      :rank_id => 1,
      :color => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new roman_calendar form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => roman_calendars_path, :method => "post" do
      assert_select "input#roman_calendar_feast_day", :name => "roman_calendar[feast_day]"
      assert_select "input#roman_calendar_rank_id", :name => "roman_calendar[rank_id]"
      assert_select "input#roman_calendar_color", :name => "roman_calendar[color]"
      assert_select "input#roman_calendar_description", :name => "roman_calendar[description]"
    end
  end
end
