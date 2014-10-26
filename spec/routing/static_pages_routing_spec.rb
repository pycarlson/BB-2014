require "rails_helper"

describe StaticPagesController do
  describe "routing" do

    it "routes to #faq" do
      expect(:get => "/faq").to route_to("static_pages#faq")
    end

    it "routes to #shopping_tips" do
      expect(:get => "/shopping_tips").to route_to("static_pages#shopping_tips")
    end

  end
end
