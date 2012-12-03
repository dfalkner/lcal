require 'spec_helper'

describe "ranks/edit" do
  before(:each) do
    @rank = assign(:rank, stub_model(Rank,
      :code => "MyString",
      :title => "MyString",
      :position => 1
    ))
  end

  it "renders the edit rank form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ranks_path(@rank), :method => "post" do
      assert_select "input#rank_code", :name => "rank[code]"
      assert_select "input#rank_title", :name => "rank[title]"
      assert_select "input#rank_position", :name => "rank[position]"
    end
  end
end
