class UsersController < ApplicationController

  def show
    if current_user
      @user = User.find(params[:id])
      p "*" * 100
      @donor = Donor.find_by_user_id(@user.id)
      p @donor
    else
      redirect_to root_path
    end
  end

end
