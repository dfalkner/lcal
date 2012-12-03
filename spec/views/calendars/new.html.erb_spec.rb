require 'spec_helper'

describe "calendars/new" do
  before(:each) do
    assign(:calendar, stub_model(Calendar,
      :season_id => 1,
      :week => 1,
      :day_of_week => "MyString",
      :rank_id => 1,
      :color_id => 1,
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new calendar form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => calendars_path, :method => "post" do
      assert_select "input#calendar_season_id", :name => "calendar[season_id]"
      assert_select "input#calendar_week", :name => "calendar[week]"
      assert_select "input#calendar_day_of_week", :name => "calendar[day_of_week]"
      assert_select "input#calendar_rank_id", :name => "calendar[rank_id]"
      assert_select "input#calendar_color_id", :name => "calendar[color_id]"
      assert_select "input#calendar_title", :name => "calendar[title]"
    end
  end
end
