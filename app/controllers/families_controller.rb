class FamiliesController < ApplicationController

  before_filter :user_is_admin?, except: [:index, :show]
  before_filter :user_is_super_admin?, only: [:destroy, :toggle_live_status]


  def index
    @families = current_user.filter_families
    @fams_five = Family.get_fams_five_and_more(@families)
    @fams_four = Family.get_fams_four(@families)
    @fams_three = Family.get_fams_three(@families)
    @fams_two = Family.get_fams_two(@families)
    @fams_one = Family.get_fams_one(@families)
  end

  def new
    @family = Family.new
    @family.family_members.build
    @drives = Drive.all
    @drop_locations = DropLocation.where('drive_id = ?', Drive.last.id)
  end

  def create
    family = Family.create!(family_params)
    family.drive_id = Drive.first.id
    family.save
    if user_is_super_admin? 
      redirect_to super_admin_path 
    else
      redirect_to data_tables_path
    end
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
      family.is_live = false
      family.save
      if user_is_super_admin? 
        redirect_to super_admin_path 
      else
        redirect_to families_path
      end
    else
      render :edit
    end
  end

  def destroy
    family = Family.find(params[:id])
    family.destroy
    if user_is_super_admin? 
      redirect_to super_admin_path
    else
      redirect_to data_tables_path
    end
  end 

  def go_live
    family = Family.find(params[:id])
    if family.update_attributes(:is_live => params[:is_live])
      redirect_to super_admin_path 
    end
  end

  def import
    Family.import(params[:file])
    redirect_to super_admin_path
  end 

  protected

  def find_family
    @family = Family.find(params[:id])
  end

  def family_params
    params.require(:family).permit(:id, :drive_id, :adopted_by, :received_at_org, :given_to_family, :code, :drop_location_id, :donor_id, :user_id, :num_boxes, :drop_date_id, :is_live, :members, family_members_attributes: [:id, :first_name, :family_id, :gender, :size_pants, :size_shirt, :size_dress, :size_shoes, :bio, :age, needs_attributes: [:id, :item, :family_member_id]])
  end

end
