class AdminPagesController < ApplicationController
  
  before_filter :user_is_admin?, only: [:data_tables]
  before_filter :user_is_super_admin?, except: [:data_tables]

  def data_tables
    @families = Family.all
    @family_members = FamilyMember.all
    @total_fams = Family.count
    @adoptions = Adoption.all
    @system_users = User.all
    @total_adoptions = Adoption.count
  end

  def super_admin_page
    @admins = Admin.all
    @super_admins = SuperAdmin.all
    @drives = Drive.all
    @families = Family.where('is_live = ?', false)
    @admin = Admin.new
    @super_admin = SuperAdmin.new
    @all_families = Family.all
    @total_fams = Family.count
    @total_adoptions = Adoption.count
  end

  def open_drive
    drive = Drive.last
    drive.status = true
    drive.save
    redirect_to super_admin_page_path
  end

  def close_drive
    drive = Drive.last
    drive.status = false
    drive.save
    redirect_to super_admin_page_path
  end
  
  def go_live
    family = Family.find(params[:format])
    family.is_live = true
    family.save
    redirect_to super_admin_page_path
  end

  def cancel_adoption 
    family = Family.find(params[:family_id])
    user = User.find(family.user_id)
    undo_adoption(user, family)
    redirect_to data_tables_path
  end

  def resend_adoption_confirmation_email
    family = Family.find(params[:family_id])
    user = User.find(params[:format])
    UserMailer.adoption_confirmation(user, family).deliver
    redirect_to data_tables_path
  end

  def reset_drive
    Drive.last.families.clear
    User.all.each do |u|
      u.families.clear
      u.drop_date_id = nil
      unless u.drop_location_id == 0
        u.drop_location_id = nil
      end
      u.save
    end
    redirect_to super_admin_page_path
  end

  private

   def undo_adoption(user, family)
    user.adoptor = false
    family.user_id = nil
    family.adopted = false
    family.save
    if user.families.length == 0
      user.drop_date = nil
      user.save
    end
  end

end
