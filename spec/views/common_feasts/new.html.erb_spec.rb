require 'spec_helper'

describe "common_feasts/new" do
  before(:each) do
    assign(:common_feast, stub_model(CommonFeast,
      :common_id => 1,
      :feast_id => 1
    ).as_new_record)
  end

  it "renders new common_feast form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => common_feasts_path, :method => "post" do
      assert_select "input#common_feast_common_id", :name => "common_feast[common_id]"
      assert_select "input#common_feast_feast_id", :name => "common_feast[feast_id]"
    end
  end
end
