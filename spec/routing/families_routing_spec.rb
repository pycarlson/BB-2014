require "rails_helper"

describe FamiliesController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/families").to route_to("families#index")
    end

    it "routes to #new" do
      expect(:get => "/families/new").to route_to("families#new")
    end

    it "routes to #edit" do
      expect(:get => "/families/1/edit").to route_to("families#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/families").to route_to("families#create")
    end

    it "routes to #update" do
      expect(:put => "/families/1").to route_to("families#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/families/1").to route_to("families#destroy", :id => "1")
    end

    it "routes to #all_families" do
      expect(:get => "/all_families").to route_to("families#all_families")
    end

    it "routes to #families_of_two_and_under" do
      expect(:get => "/families_of_two_and_under").to route_to("families#families_of_two_and_under")
    end

    it "routes to #families_of_three" do
      expect(:get => "/families_of_three").to route_to("families#families_of_three")
    end

    it "routes to #families_of_four" do
      expect(:get => "/families_of_four").to route_to("families#families_of_four")
    end

    it "routes to #families_of_five_or_more" do
      expect(:get => "/families_of_five_or_more").to route_to("families#families_of_five_or_more")
    end

  end
end
