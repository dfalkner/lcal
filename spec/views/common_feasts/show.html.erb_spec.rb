require 'spec_helper'

describe "common_feasts/show" do
  before(:each) do
    @common_feast = assign(:common_feast, stub_model(CommonFeast,
      :common_id => 1,
      :feast_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
