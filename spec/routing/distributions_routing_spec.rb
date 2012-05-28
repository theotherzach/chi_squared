require "spec_helper"

describe DistributionsController do
  describe "routing" do

    it "routes to #index" do
      get("/distributions").should route_to("distributions#index")
    end

    it "routes to #new" do
      get("/distributions/new").should route_to("distributions#new")
    end

    it "routes to #show" do
      get("/distributions/1").should route_to("distributions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/distributions/1/edit").should route_to("distributions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/distributions").should route_to("distributions#create")
    end

    it "routes to #update" do
      put("/distributions/1").should route_to("distributions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/distributions/1").should route_to("distributions#destroy", :id => "1")
    end

  end
end
