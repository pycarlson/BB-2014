class AdminPagesController < ApplicationController

  def admin
    @admins = Admin.all
    @drives = Drive.all
    @families = Family.all
  end

  def manage_families
    @families = Family.all
    @total_fams = Family.count
  end

end
