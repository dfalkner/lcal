require "spec_helper"

describe OrdosController do
  describe "routing" do

    it "routes to #index" do
      get("/ordos").should route_to("ordos#index")
    end

    it "routes to #new" do
      get("/ordos/new").should route_to("ordos#new")
    end

    it "routes to #show" do
      get("/ordos/1").should route_to("ordos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ordos/1/edit").should route_to("ordos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ordos").should route_to("ordos#create")
    end

    it "routes to #update" do
      put("/ordos/1").should route_to("ordos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ordos/1").should route_to("ordos#destroy", :id => "1")
    end

  end
end
