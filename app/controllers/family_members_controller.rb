class FamilyMembersController < ApplicationController
  
  before_filter :user_is_admin?

  def new
    @family_member = FamilyMember.new
    @family_members.needs.build
  end

  def create
    FamilyMember.create!(family_params)
    redirect_to manage_families_path
  end
  
  def edit
    @family_member = FamilyMember.find(params[:id])
  end

  def update
    @family_member = FamilyMember.find(params[:id])
    if @family_member.update_attributes(family_member_params)
      redirect_to admin_path
    else
      render :edit
    end
  end

  def destroy
    FamilyMember.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to admin_path }
      format.js
    end
  end

  protected

  def family_member_params
    params.require(:family_member).permit(:id, :first_name, :family_id, :gender, :size_pants, :size_shirt, :size_dress, :size_shoes, :bio, :age, needs_attributes: [:id, :item, :family_member_id])
  end
  
end
