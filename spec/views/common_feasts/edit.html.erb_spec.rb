require 'spec_helper'

describe "common_feasts/edit" do
  before(:each) do
    @common_feast = assign(:common_feast, stub_model(CommonFeast,
      :common_id => 1,
      :feast_id => 1
    ))
  end

  it "renders the edit common_feast form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => common_feasts_path(@common_feast), :method => "post" do
      assert_select "input#common_feast_common_id", :name => "common_feast[common_id]"
      assert_select "input#common_feast_feast_id", :name => "common_feast[feast_id]"
    end
  end
end
