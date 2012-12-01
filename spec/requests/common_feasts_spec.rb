require 'spec_helper'

describe "CommonFeasts" do
  describe "GET /common_feasts" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get common_feasts_path
      response.status.should be(200)
    end
  end
end
