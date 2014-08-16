module ApplicationHelper

  def drive_is_closed?
    Drive.last.status == false
  end

  def nav_link(text, path)
    if current_page?(path)
      link_to text, path, class: "active"
    else
      link_to text, path
    end
  end

  protected
  def user_is_admin?
    current_user && Admin.find_by_user_id(current_user.id) || user_is_super_admin?
  end

  def user_is_super_admin?
    current_user && current_user.email == ENV["P_EMAIL"] || current_user && current_user.email == ENV["SUPER_EMAIL"] || current_user && Drive.last.super_admins.include?(SuperAdmin.find_by_user_id(current_user.id))
  end
  
end
