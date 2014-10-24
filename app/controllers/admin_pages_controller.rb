class AdminPagesController < ApplicationController
  
  before_filter :user_is_admin?, only: [:data_tables, :adoption_data, :user_data, :donor_data, :family_data]
  before_filter :user_is_super_admin?, except: [:data_tables, :adoption_data, :user_data, :donor_data, :family_data]

  def data_tables
    redirect_to adoption_data_path
  end

  def adoption_data
    @adoptions = Adoption.all
  end

  def user_data
    @system_users = User.all
  end

  def donor_data
    @adoptions = Adoption.all
  end

  def family_data
    @families = Family.all
  end

  def super_admin_page
    @admins = Admin.all
    @super_admins = SuperAdmin.all
    @drives = Drive.all
    @families = Family.where('is_live = ?', false)
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

  def resend_adoption_confirmation_email
    family = Family.find(params[:family_id])
    user = User.find(params[:format])
    UserMailer.adoption_confirmation(user, family).deliver
    redirect_to data_tables_path
  end

  def reset_drive
    User.all.each do |u|
      u.adoptions.clear
      unless u.drop_location_id == 0
        u.drop_location_id = nil
        u.drop_date_id = nil
        u.save
      end
    end

    Adoption.all.each do |a|
      a.destroy
    end
    Drive.last.families.clear
    flash[:notice] = "The Adopt-a-Family Program is now reset for next year - families, adoptions, user drop locations and drop dates have been deleted."
    redirect_to super_admin_page_path
  end

end
