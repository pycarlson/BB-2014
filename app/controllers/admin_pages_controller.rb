class AdminPagesController < ApplicationController
  
  before_filter :user_is_super_admin?, except: [:manage_families, :data_tables]
  before_filter :user_is_admin?, only: [:data_tables]

  def super_admin
    @admins = Admin.all
    @drives = Drive.all
    @families = Family.where('is_live = ?', false)
  end

  def close_drive
    drive = Drive.last
    drive.status = false
    drive.save
    redirect_to super_admin_path
  end

  def open_drive
    drive = Drive.last
    drive.status = true
    drive.save
    redirect_to super_admin_path
  end

  def add_admin
    user = User.find_by_email(params[:email])
    drive = Drive.find(Drive.last.id)

    if user == nil
      flash[:alert] = "Please have user sign up."
      redirect_to super_admin_path
    else
      new_admin = Admin.find_or_create_by_user_id_and_drive_id!(user_id: user.id, drive_id: drive.id)
      redirect_to super_admin_path
    end
  end

  def go_live
    family = Family.find(params[:format])
    family.is_live = true
    family.save
    redirect_to super_admin_path
  end

  def remove_admin
    admin = Admin.find(params[:format])
    admin.destroy
    redirect_to super_admin_path
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

  def update_gift_status
    @family = Family.find(params[:id])
    drive = Drive.find(Drive.last.id)
    @family.update_attributes(:given_to_family => params[:given_to_family],
                              :received_at_org => params[:received_at_org],
                              :num_boxes => params[:num_boxes])
    redirect_to data_tables_path
  end

  def reset_drive
    Drive.last.families.clear
    User.all.each do |u|
      u.families.clear
    end
    redirect_to super_admin_path
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
