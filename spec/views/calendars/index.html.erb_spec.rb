require 'spec_helper'

describe "calendars/index" do
  before(:each) do
    assign(:calendars, [
      stub_model(Calendar,
        :season => "Season",
        :week => 1,
        :day => "Day",
        :rank => "Rank",
        :color => "Color",
        :description => "Description"
      ),
      stub_model(Calendar,
        :season => "Season",
        :week => 1,
        :day => "Day",
        :rank => "Rank",
        :color => "Color",
        :description => "Description"
      )
    ])
  end

  it "renders a list of calendars" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Season".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Day".to_s, :count => 2
    assert_select "tr>td", :text => "Rank".to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
