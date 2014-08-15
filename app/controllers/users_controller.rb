class UsersController < ApplicationController

  before_filter :user_is_super_admin?, only: [:destroy]
  before_filter :user_can_view_profile, only: [:show, :adoption_confirmation, :edit, :update]
  before_filter :get_user

  def show
    redirect_to root_path unless @user
  end

  def adoption_confirmation
    # this route just goes to the adoptions page
    @family = Family.find(params[:family_id])
    unless current_user.drop_location_id == 0
      @drop_dates = DropLocation.find(current_user.drop_location_id).drop_dates
    end
  end

  def edit
    @family = false
    unless current_user.drop_location_id == 0 || current_user.drop_location_id == nil
      @drop_dates = DropLocation.find(current_user.drop_location_id).drop_dates
    end
  end

  def update
    @user.update_attributes(user_params)
    @user.save
    if params[:user][:family_id]
      @family = Family.find(params[:user][:family_id])
      @user.create_adopted_family_associations(@family)
    end
    redirect_to user_path(@user)
  end

  def destroy
    @user.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to manage_families_path }
      format.js
    end
  end 

  protected
  def user_params
    params.require(:user).permit(:full_name, :drop_location_id, :drop_date_id, :company, :zip, :street, :city, :state, :phone, :info_complete)
  end

  def get_user
    @user = User.find(params[:id])
  end

  def user_can_view_profile
    redirect_to root_path unless current_user
  end
end
