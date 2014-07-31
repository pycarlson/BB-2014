class FamilyMemberImportsController < ApplicationController

  before_filter :user_is_admin?

  def index
    respond_to do |format|
      format.html
      format.xls
    end
  end

  def new
    @drive = Drive.last
    @family_members = FamilyMemberImport.new
  end

  def create
    @drive = Drive.last
    @family_members = FamilyMemberImport.new(params[:family_member_import], params[:drive_id])
    
    if @family_members.save
      redirect_to super_admin_path, notice: "Families imported successfully."
    else
      render :new
    end
  end

end
