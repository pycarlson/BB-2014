class DonorsController < ApplicationController
  
  def index
    @donors = Donor.all
  end

  def new
    @donor = Donor.new
    render '/donors/new'
  end

  def create

    Donor.create!(donor_params)
    redirect_to root_path #but this should redirect to their profile page which would/could be the donor profile/show page
  end

  def show
  end

  def edit 
  end

  def update
    
  end

  def destroy
    
  end

  protected
  def donor_params
    params.require(:donor).permit(:first_name, :last_name, :user_id, :drive_id, :family_id, :drop_location_id, :company, :zipcode, :street, :city, :state, :phone)
  end

end
