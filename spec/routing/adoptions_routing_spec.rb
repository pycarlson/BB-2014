require "rails_helper"

RSpec.describe AdoptionsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/adoptions").to route_to("adoptions#index")
    end

    it "routes to #new" do
      expect(:get => "/adoptions/new").to route_to("adoptions#new")
    end

    it "routes to #show" do
      expect(:get => "/adoptions/1").to route_to("adoptions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/adoptions/1/edit").to route_to("adoptions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/adoptions").to route_to("adoptions#create")
    end

    it "routes to #update" do
      expect(:put => "/adoptions/1").to route_to("adoptions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/adoptions/1").to route_to("adoptions#destroy", :id => "1")
    end

  end
end
