require 'spec_helper'

describe "ordos/edit" do
  before(:each) do
    @ordo = assign(:ordo, stub_model(Ordo,
      :code => "MyString",
      :title => "MyString",
      :position => 1
    ))
  end

  it "renders the edit ordo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ordos_path(@ordo), :method => "post" do
      assert_select "input#ordo_code", :name => "ordo[code]"
      assert_select "input#ordo_title", :name => "ordo[title]"
      assert_select "input#ordo_position", :name => "ordo[position]"
    end
  end
end
