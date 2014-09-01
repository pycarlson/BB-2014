class AdminsController < ApplicationController

  before_filter :user_is_super_admin?

  def create
    user = User.find_by_email(params[:admin][:email])
    drive = Drive.find(Drive.last.id)

    if user == nil
      flash[:alert] = "Please have user sign up."
      redirect_to super_admin_page_path
    else
      admin = Admin.create!(admin_params)
      admin.update_attributes(user_id: user.id, drive_id: drive.id)
      redirect_to super_admin_page_path
    end
  end

  def destroy
    admin = Admin.find(params[:id])
    admin.destroy
    redirect_to super_admin_page_path
  end 

  protected

  def admin_params
    params.require(:admin).permit(:email, :user_id, :drive_id)
  end

end
