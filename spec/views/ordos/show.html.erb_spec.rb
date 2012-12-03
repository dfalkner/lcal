require 'spec_helper'

describe "ordos/show" do
  before(:each) do
    @ordo = assign(:ordo, stub_model(Ordo,
      :code => "Code",
      :title => "Title",
      :position => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/Title/)
    rendered.should match(/1/)
  end
end
