require 'spec_helper'

describe "feasts/edit" do
  before(:each) do
    @feast = assign(:feast, stub_model(Feast,
      :ordo_id => 1,
      :month => 1,
      :day => 1,
      :rank_id => 1,
      :color_id => 1,
      :title => "MyString"
    ))
  end

  it "renders the edit feast form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => feasts_path(@feast), :method => "post" do
      assert_select "input#feast_ordo_id", :name => "feast[ordo_id]"
      assert_select "input#feast_month", :name => "feast[month]"
      assert_select "input#feast_day", :name => "feast[day]"
      assert_select "input#feast_rank_id", :name => "feast[rank_id]"
      assert_select "input#feast_color_id", :name => "feast[color_id]"
      assert_select "input#feast_title", :name => "feast[title]"
    end
  end
end
