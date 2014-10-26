require "rails_helper"

describe AdminsController do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "/admins/new").to route_to("admins#new")
    end

    it "routes to #create" do
      expect(:post => "/admins").to route_to("admins#create")
    end

    it "routes to #destroy" do
      expect(:delete => "/admins/1").to route_to("admins#destroy", :id => "1")
    end
  end
end
