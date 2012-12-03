require 'spec_helper'

describe "ranks/new" do
  before(:each) do
    assign(:rank, stub_model(Rank,
      :code => "MyString",
      :title => "MyString",
      :position => 1
    ).as_new_record)
  end

  it "renders new rank form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ranks_path, :method => "post" do
      assert_select "input#rank_code", :name => "rank[code]"
      assert_select "input#rank_title", :name => "rank[title]"
      assert_select "input#rank_position", :name => "rank[position]"
    end
  end
end
