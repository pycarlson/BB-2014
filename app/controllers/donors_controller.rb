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
      donor.families << family
      p "found the donor"
    else 
      donor = Donor.create!(donor_params)
      donor.families << family
      p "DID NOT and CREATED ONE"

    end
    redirect_to user_path(User.find(donor.user_id))
  end

  def straight_adopt_path
    donor = Donor.find_by_user_id(current_user.id)
    family = Family.find(params["donor"]["family_id"])
    if donor 
      donor.families << family
      p "found the donor"
    end
    redirect_to user_path(User.find(donor.user_id))
  end

  def show
    Donor.find(params[:id])
  end

  def edit 
  end

  def update
  end

  def destroy
  end

  protected
  def donor_params
    params.require(:donor).permit(:first_name, :last_name, :user_id, :drive_id, :family_id, :drop_location_id, :drop_date_id, :company, :zipcode, :street, :city, :state, :phone)
  end

end
