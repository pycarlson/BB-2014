class UsersController < ApplicationController

  def show
    if current_user
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def edit
    @family = false
    @user = User.find(params[:id])
    @drop_dates = DropLocation.find(current_user.drop_location_id).drop_dates
  end

  def update
    current_user.update_attributes(user_params)
    current_user.adoptor = true
    current_user.info_complete = true
    current_user.save
    if params[:user][:family_id]
      family = Family.find(params[:user][:family_id])
      family.adopted = true
      family.save
      current_user.families << family
      current_user.info_complete = true
      current_user.save
    end
    redirect_to user_path(current_user)
  end

  def adoption_confirmation
    @user = current_user
    @family = Family.find(params[:family_id])
    @drop_dates = DropLocation.find(current_user.drop_location_id).drop_dates
  end

  protected
  def user_params
    params.require(:user).permit(:full_name, :drop_location_id, :drop_date_id, :company, :zip, :street, :city, :state, :phone, :info_complete)
  end

end
