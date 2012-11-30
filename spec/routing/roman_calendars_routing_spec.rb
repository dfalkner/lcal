require "spec_helper"

describe RomanCalendarsController do
  describe "routing" do

    it "routes to #index" do
      get("/roman_calendars").should route_to("roman_calendars#index")
    end

    it "routes to #new" do
      get("/roman_calendars/new").should route_to("roman_calendars#new")
    end

    it "routes to #show" do
      get("/roman_calendars/1").should route_to("roman_calendars#show", :id => "1")
    end

    it "routes to #edit" do
      get("/roman_calendars/1/edit").should route_to("roman_calendars#edit", :id => "1")
    end

    it "routes to #create" do
      post("/roman_calendars").should route_to("roman_calendars#create")
    end

    it "routes to #update" do
      put("/roman_calendars/1").should route_to("roman_calendars#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/roman_calendars/1").should route_to("roman_calendars#destroy", :id => "1")
    end

  end
end
