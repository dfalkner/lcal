require 'spec_helper'

describe "principals/show" do
  before(:each) do
    @principal = assign(:principal, stub_model(Principal,
      :year => 1,
      :dominical_year => "Dominical Year",
      :weeks_in_ordinary_time_before_lent => 2,
      :starting_week_of_ordinary_time_after_easter => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Dominical Year/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
