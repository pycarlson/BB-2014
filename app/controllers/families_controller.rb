class FamiliesController < ApplicationController

  before_filter :user_is_admin?, only: [:new, :edit, :create, :update]
  before_filter :user_is_super_admin?, only: [:destroy, :toggle_live_status, :go_live]
  before_filter :find_family, except: [:index, :all_families, :new, :create, :families_of_two_and_under, :families_of_three, :families_of_four, :families_of_five_or_more]
  before_filter :family_is_in_users_location, only: [:show]
  before_filter :user_is_logged_id?


  def index
    @families = Family.order(:code)
    respond_to do |format|
      format.html
      format.csv { render text: @families.to_csv }
    end
  end

  def all_families
    redirect_to families_of_five_or_more_path
  end

  def families_of_two_and_under
    @families = Family.filter_families(current_user)
    @fams_two_and_under = Family.get_fams_two(@families)
    @family_size = 'two people and fewer'
  end

  def families_of_three
    @families = Family.filter_families(current_user)
    @fams_three = Family.get_fams_three(@families)
    @family_size = 'three people'
  end

  def families_of_four
    @families = Family.filter_families(current_user)
    @fams_four = Family.get_fams_four(@families)
    @family_size = 'four people'
  end

  def families_of_five_or_more
    @families = Family.filter_families(current_user)
    @fams_five_or_more = Family.get_fams_five_and_more(@families)
    @family_size = 'five or more people'
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
    redirect_to family_data_path
  end

  def show
    @adoption = Adoption.new
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
      redirect_to data_tables_path
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

  def import
    Family.import(params[:file])
    redirect_to super_admin_page_path
  end 

  protected

  def user_is_logged_id? 
    unless current_user
      flash[:alert] = "Please sign in or sign up to view families."
      redirect_to root_path
    end
  end

  def find_family
    @family = Family.find(params[:id])
  end

  def family_is_in_users_location
    unless @family.drop_location_id == current_user.drop_location_id || current_user.drop_location_id == 0
      flash[:alert] = "The family you're looking for isn't in your chosen drop location." 
      redirect_to all_families_path
    end
  end

  def family_params
    params.require(:family).permit(:drive_id, :code, :drop_location_id, :user_id, :adoption_id, :is_live, :members, family_members_attributes: [:id, :first_name, :family_id, :gender, :size_pants, :size_shirt, :size_dress, :size_shoes, :bio, :age, needs_attributes: [:id, :item, :family_member_id]])
  end

end
