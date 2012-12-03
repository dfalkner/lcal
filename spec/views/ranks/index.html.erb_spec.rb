require 'spec_helper'

describe "ranks/index" do
  before(:each) do
    assign(:ranks, [
      stub_model(Rank,
        :code => "Code",
        :title => "Title",
        :position => 1
      ),
      stub_model(Rank,
        :code => "Code",
        :title => "Title",
        :position => 1
      )
    ])
  end

  it "renders a list of ranks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
