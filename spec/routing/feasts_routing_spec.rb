require "spec_helper"

describe FeastsController do
  describe "routing" do

    it "routes to #index" do
      get("/feasts").should route_to("feasts#index")
    end

    it "routes to #new" do
      get("/feasts/new").should route_to("feasts#new")
    end

    it "routes to #show" do
      get("/feasts/1").should route_to("feasts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/feasts/1/edit").should route_to("feasts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/feasts").should route_to("feasts#create")
    end

    it "routes to #update" do
      put("/feasts/1").should route_to("feasts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/feasts/1").should route_to("feasts#destroy", :id => "1")
    end

  end
end
