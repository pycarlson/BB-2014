class UsersController < ApplicationController

  before_filter :user_is_super_admin?, only: [:destroy, :index]
  before_filter :user_can_view_profile, only: [:show, :edit, :update]
  before_filter :get_user, except: [:index]

  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.csv { render text: @users.to_csv }
    end
  end

  def show
    @drive = Drive.last
    @drop_locations = @drive.drop_locations
    redirect_to root_path unless @user
  end

  def edit
    
  end

  def update
    @user.update_attributes(user_params)
    @user.save
    redirect_to user_path(@user)
  end

  def destroy
    @user.remove_as_admin
    @user.remove_if_super_admin
    @user.destroy
    redirect_to super_admin_page_path
  end 

  protected
  def user_params
    params.require(:user).permit(:first_name, :last_name, :drop_location_id, :drop_date_id, :company, :zip, :street, :city, :state, :phone, :password, :password_confirmation)
  end

  def get_user
    @user = User.find(params[:id])
  end

  def user_can_view_profile
    redirect_to root_path unless current_user
  end
end
