class OrganizationsController < ApplicationController
  
  before_filter :user_is_admin?

  def new
    @organization = Organization.new
  end

  def create
    organization = Organization.create!(org_params)
    if organization.save
      redirect_to super_admin_page_path
    end
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])
    if @organization.update_attributes(organization_params)
      redirect_to super_admin_page_path
     else
      render :edit
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :blurb, :email, :phone, :address, :zip, :website_url)
  end

end
