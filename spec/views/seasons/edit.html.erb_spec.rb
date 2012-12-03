require 'spec_helper'

describe "seasons/edit" do
  before(:each) do
    @season = assign(:season, stub_model(Season,
      :code => "MyString",
      :title => "MyString"
    ))
  end

  it "renders the edit season form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => seasons_path(@season), :method => "post" do
      assert_select "input#season_code", :name => "season[code]"
      assert_select "input#season_title", :name => "season[title]"
    end
  end
end
