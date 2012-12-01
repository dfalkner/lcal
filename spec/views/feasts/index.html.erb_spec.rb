require 'spec_helper'

describe "feasts/index" do
  before(:each) do
    assign(:feasts, [
      stub_model(Feast,
        :ordo_id => 1,
        :month => 2,
        :day => 3,
        :rank_id => 4,
        :color_id => 5,
        :title => "Title"
      ),
      stub_model(Feast,
        :ordo_id => 1,
        :month => 2,
        :day => 3,
        :rank_id => 4,
        :color_id => 5,
        :title => "Title"
      )
    ])
  end

  it "renders a list of feasts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
