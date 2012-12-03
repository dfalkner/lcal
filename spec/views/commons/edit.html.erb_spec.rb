require 'spec_helper'

describe "commons/edit" do
  before(:each) do
    @common = assign(:common, stub_model(Common,
      :code => "MyString",
      :title => "MyString"
    ))
  end

  it "renders the edit common form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => commons_path(@common), :method => "post" do
      assert_select "input#common_code", :name => "common[code]"
      assert_select "input#common_title", :name => "common[title]"
    end
  end
end
