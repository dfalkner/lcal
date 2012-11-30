require 'spec_helper'

describe "calendars/show" do
  before(:each) do
    @calendar = assign(:calendar, stub_model(Calendar,
      :season => "Season",
      :week => 1,
      :day => "Day",
      :rank => "Rank",
      :color => "Color",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Season/)
    rendered.should match(/1/)
    rendered.should match(/Day/)
    rendered.should match(/Rank/)
    rendered.should match(/Color/)
    rendered.should match(/Description/)
  end
end
