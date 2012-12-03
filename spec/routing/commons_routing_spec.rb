require "spec_helper"

describe CommonsController do
  describe "routing" do

    it "routes to #index" do
      get("/commons").should route_to("commons#index")
    end

    it "routes to #new" do
      get("/commons/new").should route_to("commons#new")
    end

    it "routes to #show" do
      get("/commons/1").should route_to("commons#show", :id => "1")
    end

    it "routes to #edit" do
      get("/commons/1/edit").should route_to("commons#edit", :id => "1")
    end

    it "routes to #create" do
      post("/commons").should route_to("commons#create")
    end

    it "routes to #update" do
      put("/commons/1").should route_to("commons#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/commons/1").should route_to("commons#destroy", :id => "1")
    end

  end
end
