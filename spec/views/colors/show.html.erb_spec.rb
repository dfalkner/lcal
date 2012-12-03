require 'spec_helper'

describe "colors/show" do
  before(:each) do
    @color = assign(:color, stub_model(Color,
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
