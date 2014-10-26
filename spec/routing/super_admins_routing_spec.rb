require "rails_helper"

describe SuperAdminsController do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "/super_admins/new").to route_to("super_admins#new")
    end

    it "routes to #create" do
      expect(:post => "/super_admins").to route_to("super_admins#create")
    end

    it "routes to #destroy" do
      expect(:delete => "/super_admins/1").to route_to("super_admins#destroy", :id => "1")
    end
  end
end
