require 'spec_helper'

describe "calendars/edit" do
  before(:each) do
    @calendar = assign(:calendar, stub_model(Calendar,
      :season => "MyString",
      :week => 1,
      :day => "MyString",
      :rank => "MyString",
      :color => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit calendar form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => calendars_path(@calendar), :method => "post" do
      assert_select "input#calendar_season", :name => "calendar[season]"
      assert_select "input#calendar_week", :name => "calendar[week]"
      assert_select "input#calendar_day", :name => "calendar[day]"
      assert_select "input#calendar_rank", :name => "calendar[rank]"
      assert_select "input#calendar_color", :name => "calendar[color]"
      assert_select "input#calendar_description", :name => "calendar[description]"
    end
  end
end
