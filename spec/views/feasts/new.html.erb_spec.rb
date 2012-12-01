require 'spec_helper'

describe "feasts/new" do
  before(:each) do
    assign(:feast, stub_model(Feast,
      :ordo_id => 1,
      :month => 1,
      :day => 1,
      :rank_id => 1,
      :color_id => 1,
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new feast form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => feasts_path, :method => "post" do
      assert_select "input#feast_ordo_id", :name => "feast[ordo_id]"
      assert_select "input#feast_month", :name => "feast[month]"
      assert_select "input#feast_day", :name => "feast[day]"
      assert_select "input#feast_rank_id", :name => "feast[rank_id]"
      assert_select "input#feast_color_id", :name => "feast[color_id]"
      assert_select "input#feast_title", :name => "feast[title]"
    end
  end
end
