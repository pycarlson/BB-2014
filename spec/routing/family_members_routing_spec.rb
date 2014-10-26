require "rails_helper"

describe FamilyMembersController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "families/1/family_members").to route_to("family_members#index", :family_id => "1")
    end

    it "routes to #new" do
      expect(:get => "families/1/family_members/new").to route_to("family_members#new", :family_id => "1")
    end

    it "routes to #create" do
      expect(:post => "families/1/family_members").to route_to("family_members#create", :family_id => "1")
    end

    it "routes to #edit" do
      expect(:get => "families/1/family_members/1/edit").to route_to("family_members#edit", :family_id => "1", :id => "1")
    end

    it "routes to #update" do
      expect(:put => "families/1/family_members/1").to route_to("family_members#update", :family_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "families/1/family_members/1").to route_to("family_members#destroy", :family_id => "1", :id => "1")
    end
  end
end
