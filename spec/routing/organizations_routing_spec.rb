require "rails_helper"

describe OrganizationsController do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "/organizations/new").to route_to("organizations#new")
    end

    it "routes to #edit" do
      expect(:get => "/organizations/1/edit").to route_to("organizations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/organizations").to route_to("organizations#create")
    end

    it "routes to #update" do
      expect(:put => "/organizations/1").to route_to("organizations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/organizations/1").to route_to("organizations#destroy", :id => "1")
    end

  end
end
