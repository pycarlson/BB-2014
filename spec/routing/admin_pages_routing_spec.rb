require "rails_helper"

describe AdminPagesController do
  describe "routing" do

    it "routes to #data_tables" do
      expect(:get => "/data_tables").to route_to("admin_pages#data_tables")
    end

    it "routes to #adoption_data" do
      expect(:get => "/adoption_data").to route_to("admin_pages#adoption_data")
    end

    it "routes to #user_data" do
      expect(:get => "/user_data").to route_to("admin_pages#user_data")
    end

    it "routes to #donor_data" do
      expect(:get => "/donor_data").to route_to("admin_pages#donor_data")
    end

    it "routes to #family_data" do
      expect(:get => "/family_data").to route_to("admin_pages#family_data")
    end

    it "routes to #super_admin_page" do
      expect(:get => "/super_admin_page").to route_to("admin_pages#super_admin_page")
    end

    it "routes to #open_drive" do
      expect(:get => "/open_drive").to route_to("admin_pages#open_drive")
    end

    it "routes to #close_drive" do
      expect(:get => "/close_drive").to route_to("admin_pages#close_drive")
    end

    it "routes to #go_live" do
      expect(:get => "/go_live").to route_to("admin_pages#go_live")
    end

    it "routes to #resend_adoption_confirmation_email" do
      expect(:get => "/resend_adoption_confirmation_email").to route_to("admin_pages#resend_adoption_confirmation_email")
    end

    it "routes to #reset_drive" do
      expect(:get => "/reset_drive").to route_to("admin_pages#reset_drive")
    end
  end
end

