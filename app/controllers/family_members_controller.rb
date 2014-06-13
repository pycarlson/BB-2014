class FamilyMembersController < ApplicationController
  
  def edit
    @family_member = FamilyMember.find(params[:id])
  end

  def update
    @family_member = FamilyMember.find(params[:id])
  end

  def destroy
  end

  protected

  def family_member_params
    params.require(:family_member).permit(:id, :family_id, :gender, :size_pants, :size_shirt, :size_dress, :size_shoes, :bio, :age)
  end
  
end
