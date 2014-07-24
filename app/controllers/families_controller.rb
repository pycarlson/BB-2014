class FamiliesController < ApplicationController
  
  before_filter :user_is_admin?, except: [:index, :show]

  def index
    @families = current_user.filter_families
  end

  def new
    @family = Family.new
    @family.family_members.build
    @drives = Drive.all
    @drop_locations = DropLocation.where('drive_id = ?', Drive.last.id)
  end

  def create
    Family.create!(family_params)
    redirect_to data_tables_path
  end

  def show
    @family = Family.find(params[:id])
    @drive = Drive.find(@family.drive_id)
  end

  def edit 
    @family = Family.find(params[:id])
    @drives = Drive.all
    @drop_locations = DropLocation.where('drive_id = ?', Drive.last.id)
  end

  def update
    family = Family.find(params[:id])
    if family.update_attributes(family_params)
      redirect_to manage_families_path
    else
      render :edit
    end
  end

  def destroy
    family = Family.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to manage_families_path }
      format.js
    end
  end 

  def toggle_live_status
    family = Family.find(params[:id])

    if family.update_attributes(:is_live => params[:is_live])
      render :nothing => true
    else
      render :nothing => true
    end
  end

  # def import
  #   Product.import(params[:file])
  #   redirect_to root_path, notice: "Products imported."
  # end 

  protected

  def find_family
    @family = Family.find(params[:id])
  end

  def family_params
    params.require(:family).permit(:id, :drive_id, :adopted_by, :received_at_org, :given_to_family, :code, :drop_location_id, :donor_id, :user_id, :num_boxes, :drop_date_id, :is_live, :members, family_members_attributes: [:id, :first_name, :family_id, :gender, :size_pants, :size_shirt, :size_dress, :size_shoes, :bio, :age, needs_attributes: [:id, :item, :family_member_id]])
  end

end
