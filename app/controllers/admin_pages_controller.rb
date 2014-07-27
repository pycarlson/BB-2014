class AdminPagesController < ApplicationController
  
  before_filter :user_is_admin?, only: [:manage_families]

  before_filter :user_is_super_admin?, only: [:super_admin, :add_admin, :remove_admin, :cancel_adoption]

  def super_admin
    @admins = Admin.all
    @drives = Drive.all
    @families = Family.where('is_live = ?', false)
  end

  def add_admin
    user = User.find_by_email(params[:email])
    drive = Drive.find(Drive.last.id)

    if user == nil
      flash[:alert] = "Please have user sign up."
      redirect_to admin_path
    else
      user.drop_location_id = 0
      user.save
      new_admin = Admin.create!(user_id: user.id, drive_id: drive.id)
      redirect_to super_admin_path
    end
  end

  def remove_admin
    admin = Admin.find(params[:format])
    user = User.find(admin.user_id)
    user.drop_location_id = nil
    user.save
    admin.destroy
    redirect_to super_admin_path
  end

  def cancel_adoption 
    family = Family.find(params[:family_id])
    user = User.find(family.user_id)
    user.adoptor = false
    family.user_id = nil
    family.adopted = false
    family.save
    if user.families.length == 0
      user.drop_date = nil
      user.save
    end
    
    redirect_to data_tables_path
  end

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

end
