require "rails_helper"

describe FamilyMemberImportsController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/family_member_imports").to route_to("family_member_imports#index")
    end

    it "routes to #new" do
      expect(:get => "/family_member_imports/new").to route_to("family_member_imports#new")
    end

    it "routes to #create" do
      expect(:post => "/family_member_imports").to route_to("family_member_imports#create")
    end
  end
end
