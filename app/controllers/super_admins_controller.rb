class SuperAdminsController < ApplicationController

  before_filter :user_is_super_admin?

  def create
    user = User.find_by_email(params[:super_admin][:email])
    drive = Drive.find(Drive.last.id)

    if user == nil
      flash[:alert] = "Please have user sign up."
      redirect_to super_admin_page_path
    else
      super_admin = SuperAdmin.create!(super_admin_params)
      super_admin.update_attributes(drive_id: drive.id, user_id: user.id)
      redirect_to super_admin_page_path
    end
  end

  def destroy
    super_admin = SuperAdmin.find(params[:id])
    super_admin.destroy
    redirect_to super_admin_page_path
  end 

  protected

  def super_admin_params
    params.require(:super_admin).permit(:email, :user_id, :drive_id)
  end

end
