require 'spec_helper'

describe "common_feasts/index" do
  before(:each) do
    assign(:common_feasts, [
      stub_model(CommonFeast,
        :common_id => 1,
        :feast_id => 2
      ),
      stub_model(CommonFeast,
        :common_id => 1,
        :feast_id => 2
      )
    ])
  end

  it "renders a list of common_feasts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
