require 'spec_helper'

describe "principals/index" do
  before(:each) do
    assign(:principals, [
      stub_model(Principal,
        :year => 1,
        :dominical_year => "Dominical Year",
        :weeks_in_ordinary_time_before_lent => 2,
        :starting_week_of_ordinary_time_after_easter => 3
      ),
      stub_model(Principal,
        :year => 1,
        :dominical_year => "Dominical Year",
        :weeks_in_ordinary_time_before_lent => 2,
        :starting_week_of_ordinary_time_after_easter => 3
      )
    ])
  end

  it "renders a list of principals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Dominical Year".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
