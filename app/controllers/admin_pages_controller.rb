class AdminPagesController < ApplicationController
  
  before_filter :user_is_admin?, only: [:manage_families]

  before_filter :user_is_super_admin?, only: [:admin]

  def admin
    @admins = Admin.all
    @drives = Drive.all
    @families = Family.where('is_live = ?', false)
  end

  def manage_families
    @families = Family.all
    @family_members = FamilyMember.all
    @total_fams = Family.count
    @donors = Donor.all
    
    @adopted_families = []

    @families.each do |fam| 
      if fam.adopted == true
        @adopted_families << fam
      end
    end
  end

end
