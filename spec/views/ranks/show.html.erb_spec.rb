require 'spec_helper'

describe "ranks/show" do
  before(:each) do
    @rank = assign(:rank, stub_model(Rank,
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
