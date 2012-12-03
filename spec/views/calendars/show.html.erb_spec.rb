require 'spec_helper'

describe "calendars/show" do
  before(:each) do
    @calendar = assign(:calendar, stub_model(Calendar,
      :season_id => 1,
      :week => 2,
      :day_of_week => "Day Of Week",
      :rank_id => 3,
      :color_id => 4,
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Day Of Week/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/Title/)
  end
end
