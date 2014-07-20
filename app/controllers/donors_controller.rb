class DonorsController < ApplicationController

  before_filter :user_is_admin?, only: [:index, :destroy]

  def index
    @donors = Donor.all
  end

  def new
    @donor = Donor.new
    @family_id = params[:family_id]
    @drop_dates = DropLocation.find(current_user.drop_location_id).drop_dates
  end

  def create
    donor = Donor.find_by_user_id(current_user.id)
    family = Family.find(params["donor"]["family_id"])
    if donor 
      family.adopted = true
      family.save
      donor.families << family
    else 
      donor = Donor.create!(donor_params)
      family.adopted = true
      family.save
      donor.families << family
    end
    redirect_to user_path(User.find(donor.user_id))
  end

  # def straight_adopt_path
  #   donor = Donor.find_by_user_id(current_user.id)
  #   family = Family.find(params["donor"]["family_id"])
  #   if donor 
  #     family.adopted = true
  #     family.save
  #     donor.families << family
  #   end
  #   redirect_to user_path(User.find(donor.user_id))
  # end

  def show
    Donor.find(params[:id])
  end

  def edit 
    @donor = Donor.find(params[:id])
    @drop_dates = DropLocation.find(current_user.drop_location_id).drop_dates
  end

  def update
    donor = Donor.find(params[:id])
    donor.update_attributes(donor_params)
    redirect_to user_path(donor.user_id)
  end

  def destroy
  end

  protected
  def donor_params
    params.require(:donor).permit(:first_name, :last_name, :user_id, :drive_id, :family_id, :drop_location_id, :drop_date_id, :company, :zipcode, :street, :city, :state, :phone)
  end

end
