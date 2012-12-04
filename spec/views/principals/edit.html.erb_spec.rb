require 'spec_helper'

describe "principals/edit" do
  before(:each) do
    @principal = assign(:principal, stub_model(Principal,
      :year => 1,
      :dominical_year => "MyString",
      :weeks_in_ordinary_time_before_lent => 1,
      :starting_week_of_ordinary_time_after_easter => 1
    ))
  end

  it "renders the edit principal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => principals_path(@principal), :method => "post" do
      assert_select "input#principal_year", :name => "principal[year]"
      assert_select "input#principal_dominical_year", :name => "principal[dominical_year]"
      assert_select "input#principal_weeks_in_ordinary_time_before_lent", :name => "principal[weeks_in_ordinary_time_before_lent]"
      assert_select "input#principal_starting_week_of_ordinary_time_after_easter", :name => "principal[starting_week_of_ordinary_time_after_easter]"
    end
  end
end
