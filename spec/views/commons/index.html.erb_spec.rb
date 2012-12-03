require 'spec_helper'

describe "commons/index" do
  before(:each) do
    assign(:commons, [
      stub_model(Common,
        :code => "Code",
        :title => "Title"
      ),
      stub_model(Common,
        :code => "Code",
        :title => "Title"
      )
    ])
  end

  it "renders a list of commons" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
