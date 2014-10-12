class DrivesController < ApplicationController

  before_filter :user_is_super_admin?

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
    if @drive.update_attributes(drive_params)
      flash[:notice] = "Gift drive updated successfully."
    else
      render :edit
    end
    redirect_to root_path
  end

  def destroy
    Drive.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to admin_path }
      format.js
    end
  end

  private

  def drive_params
    params.require(:drive).permit(:id, :year, :blurb, :start_date, :end_date, :fundraising_url, :fundraising_blurb, :donation_receipt_link, drop_locations_attributes: [:id, :drive_id, :name, :street, :city, :state, :zipcode, drop_dates_attributes: [:id, :date, :start_time, :end_time, :drop_location_id]])
  end

end
