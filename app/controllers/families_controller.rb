class FamiliesController < ApplicationController

  before_filter :user_is_admin?, except: [:index, :show, :update_gift_status]
  before_filter :user_is_super_admin?, only: [:destroy, :toggle_live_status]
  before_filter :find_family, except: [:index, :new, :create]
  before_filter :family_is_in_users_location, only: [:show]


  def index
    @families = Family.filter_families(current_user)
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
    @family = Family.find_or_create_by(id: params[:id])
    @family.update_attributes(family_params)
    if @family.save
      @family.drive_id = Drive.last.id
      @family.save
    else
      flash[:alert] = "The family you just tried to create already exists."
      redirect_to new_family_path
      return
    end
    if current_user.is_super? 
      redirect_to super_admin_page_path
    else
      redirect_to data_tables_path
    end
  end

  def show
    @drive = Drive.find(@family.drive_id)
  end

  def edit 
    @drives = Drive.all
    @drop_locations = DropLocation.where('drive_id = ?', Drive.last.id)
  end

  def update
    if @family.update_attributes(family_params)
      @family.is_live = false
      @family.save
      if current_user.is_super? 
        redirect_to super_admin_page_path
      else
        redirect_to data_tables_path
      end
    else
      render :edit
    end
  end

  def destroy
    @family.destroy
    redirect_to super_admin_page_path
  end 

  def go_live
    if @family.update_attributes(:is_live => params[:is_live])
      redirect_to super_admin_page_path 
    end
  end

  def update_gift_status
    drive = Drive.find(Drive.last.id)
    @family.update_attributes(:given_to_family => params[:given_to_family],
                              :received_at_org => params[:received_at_org],
                              :num_boxes => params[:num_boxes])
    
    redirect_to data_tables_path
  end

  def import
    Family.import(params[:file])
    redirect_to super_admin_page_path
  end 

  protected

  def find_family
    @family = Family.find(params[:id])
  end

  def family_is_in_users_location
    unless @family.drop_location_id == current_user.drop_location_id || current_user.drop_location_id == 0
      flash[:alert] = "The family you're looking for isn't in your chosen drop location." 
      redirect_to families_path
    end
  end

  def family_params
    params.require(:family).permit(:id, :drive_id, :adopted_by, :received_at_org, :given_to_family, :code, :drop_location_id, :donor_id, :user_id, :num_boxes, :drop_date_id, :is_live, :members, family_members_attributes: [:id, :first_name, :family_id, :gender, :size_pants, :size_shirt, :size_dress, :size_shoes, :bio, :age, needs_attributes: [:id, :item, :family_member_id]])
  end

end
