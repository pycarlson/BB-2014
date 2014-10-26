require "rails_helper"

describe DrivesController do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "/drives/new").to route_to("drives#new")
    end

    it "routes to #edit" do
      expect(:get => "/drives/1/edit").to route_to("drives#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/drives").to route_to("drives#create")
    end

    it "routes to #update" do
      expect(:put => "/drives/1").to route_to("drives#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/drives/1").to route_to("drives#destroy", :id => "1")
    end
  end
end

