require 'spec_helper'

describe "feasts/show" do
  before(:each) do
    @feast = assign(:feast, stub_model(Feast,
      :ordo_id => 1,
      :month => 2,
      :day => 3,
      :rank_id => 4,
      :color_id => 5,
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/Title/)
  end
end
