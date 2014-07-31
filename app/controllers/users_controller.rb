class UsersController < ApplicationController

  before_filter :user_is_super_admin?, only: [:destroy]

  def show
    @user = User.find(params[:id])
    p "*" * 100
    p params
    redirect_to root_path unless @user
  end

  def edit
    @family = false
    @user = User.find(params[:id])
    unless current_user.drop_location_id == 0
      @drop_dates = DropLocation.find(current_user.drop_location_id).drop_dates
    end
  end

  def update
    @user = current_user
    @user.update_attributes(user_params)
    @user.adoptor = true
    @user.info_complete = true
    @user.save
    if params[:user][:family_id]
      family = Family.find(params[:user][:family_id])
      family.adopted = true
      family.save
      @user.families << family
      UserMailer.adoption_confirmation(@user).deliver
      @user.info_complete = true
      @user.save
    end
    redirect_to user_path(@user)
  end

  def adoption_confirmation
    @user = current_user
    @family = Family.find(params[:family_id])
    unless current_user.drop_location_id == 0
      @drop_dates = DropLocation.find(current_user.drop_location_id).drop_dates
    end
  end

  def destroy
    user = User.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to manage_families_path }
      format.js
    end
  end 

  protected
  def user_params
    params.require(:user).permit(:full_name, :drop_location_id, :drop_date_id, :company, :zip, :street, :city, :state, :phone, :info_complete)
  end
end
