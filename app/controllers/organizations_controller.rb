class OrganizationsController < ApplicationController
  
  before_filter :user_is_super_admin?

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.create!(org_params)
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])
    @organization.update_attributes(organization_params)
    redirect_to admin_path
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :blurb, :email, :phone, :address, :zip, :website_url)
  end

end
