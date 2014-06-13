class DrivesController < ApplicationController

  def new
    @drive = Drive.new
    @drive.drop_locations.build
  end

  def create
    drive = Drive.create!(drive_params)
    redirect_to root_path
  end

  def edit
    @drive = Drive.find(params[:id])
  end

  def update
    @drive = Drive.find(params[:id])
    @drive.update_attributes(drive_params)
    redirect_to root_path
  end

  def destroy
    Drive.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def add_admin
    user = User.find_by_email(params[:email])
    drive = Drive.find(Drive.last.id)

    if user == nil
      flash[:alert] = "Please have user sign up."
      redirect_to admin_path
    else
      new_admin = Admin.create!(user_id: user.id, drive_id: drive.id)
      redirect_to admin_path
    end
  end

  def close_drive
    drive = Drive.find(params[:id])

    if drive.update_attributes(:status => params[:status])
      render :nothing => true
    else
      render :nothing => true
    end
  end

  private

  def drive_params
    params.require(:drive).permit(:id, :year, :blurb, :start_date, :end_date, :fundraising_url, :fundraising_blurb, :donation_receipt_link, drop_locations_attributes: [:id, :drive_id, :name, :street, :city, :state, :zipcode, drop_dates_attributes: [:id, :date_and_time, :drop_location_id]])
  end

end
