require 'spec_helper'

describe "commons/show" do
  before(:each) do
    @common = assign(:common, stub_model(Common,
      :code => "Code",
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/Title/)
  end
end
