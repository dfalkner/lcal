require 'spec_helper'

describe "seasons/new" do
  before(:each) do
    assign(:season, stub_model(Season,
      :code => "MyString",
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new season form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => seasons_path, :method => "post" do
      assert_select "input#season_code", :name => "season[code]"
      assert_select "input#season_title", :name => "season[title]"
    end
  end
end
