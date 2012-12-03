require 'spec_helper'

describe "calendars/index" do
  before(:each) do
    assign(:calendars, [
      stub_model(Calendar,
        :season_id => 1,
        :week => 2,
        :day_of_week => "Day Of Week",
        :rank_id => 3,
        :color_id => 4,
        :title => "Title"
      ),
      stub_model(Calendar,
        :season_id => 1,
        :week => 2,
        :day_of_week => "Day Of Week",
        :rank_id => 3,
        :color_id => 4,
        :title => "Title"
      )
    ])
  end

  it "renders a list of calendars" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Day Of Week".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
