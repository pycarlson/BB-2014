class AdminPagesController < ApplicationController
  
  before_filter :user_is_admin?, only: [:data_tables]
  before_filter :user_is_super_admin?, except: [:data_tables]

  def data_tables
    @families = Family.all
    @family_members = FamilyMember.all
    @total_fams = Family.count
    @adoptors = User.where(adoptor: true)
    @system_users = User.all

    @adopted_families = []

    @families.each do |fam| 
      if fam.adopted == true
        @adopted_families << fam
      end
    end
    @left_unadopted = @total_fams - @adopted_families.count
  end

  def super_admin_page
    @admins = Admin.all
    @super_admins = SuperAdmin.all
    @drives = Drive.all
    @families = Family.where('is_live = ?', false)
    @admin = Admin.new
    @super_admin = SuperAdmin.new
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
    user = User.find(params[:format])
    UserMailer.adoption_confirmation(user).deliver
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
