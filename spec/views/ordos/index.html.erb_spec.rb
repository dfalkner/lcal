require 'spec_helper'

describe "ordos/index" do
  before(:each) do
    assign(:ordos, [
      stub_model(Ordo,
        :code => "Code",
        :title => "Title",
        :position => 1
      ),
      stub_model(Ordo,
        :code => "Code",
        :title => "Title",
        :position => 1
      )
    ])
  end

  it "renders a list of ordos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
