require "spec_helper"

describe PrincipalsController do
  describe "routing" do

    it "routes to #index" do
      get("/principals").should route_to("principals#index")
    end

    it "routes to #new" do
      get("/principals/new").should route_to("principals#new")
    end

    it "routes to #show" do
      get("/principals/1").should route_to("principals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/principals/1/edit").should route_to("principals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/principals").should route_to("principals#create")
    end

    it "routes to #update" do
      put("/principals/1").should route_to("principals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/principals/1").should route_to("principals#destroy", :id => "1")
    end

  end
end
